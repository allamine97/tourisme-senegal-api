#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import re
import time
import logging
from typing import Dict, List, Optional

import requests
import psycopg2
from bs4 import BeautifulSoup
from dotenv import load_dotenv

# -------------------------------------------------
# CONFIG
# -------------------------------------------------

BASE_URL = "https://www.jesuismort.com"
LIST_URL = f"{BASE_URL}/cimetiere/senegalais-et-senegalaise"
HEADERS = {"User-Agent": "Mozilla/5.0 (compatible; DataResearchBot/1.0)"}
REQUEST_TIMEOUT = 15
SLEEP_BETWEEN_REQUESTS = 1.5  # respect du site

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

load_dotenv()

# -------------------------------------------------
# DATABASE
# -------------------------------------------------
#https://www.w3schools.com/postgresql/postgresql_create_table.php
def get_db_connection():
    return psycopg2.connect(
        #host=os.getenv("DB_HOST"),
        #port=os.getenv("DB_PORT"),
        #dbname=os.getenv("DB_NAME"),
        #user=os.getenv("DB_USER"),
        #password=os.getenv("DB_PASSWORD")
        
        host="localhost",
        port=5432,
        dbname="postgres",
        user="postgres",
        password="senegal" #To change and remove after testing
    )

# -------------------------------------------------
# SCRAPER
# -------------------------------------------------

class PersonalityScraper:
    def __init__(self):
        self.session = requests.Session()
        self.session.headers.update(HEADERS)

    def fetch(self, url: str) -> BeautifulSoup:
        response = self.session.get(url, timeout=REQUEST_TIMEOUT)
        response.raise_for_status()
        return BeautifulSoup(response.text, "html.parser")

    @staticmethod
    def clean_text(text: str) -> str:
        return re.sub(r"\s+", " ", text).strip()

    def get_list_links(self) -> List[str]:
        soup = self.fetch(LIST_URL)
        links = soup.find_all("a", class_="linkCelebrity")
        return [BASE_URL + link["href"] for link in links if link.get("href")]

    def parse_person(self, url: str) -> Optional[Dict]:
        try:
            soup = self.fetch(url)

            nom = self.clean_text(soup.find(id="page_h1").text)
            description = self.clean_text(soup.find("div", class_="iconBlock").text)
            biographie = self.clean_text(soup.find(id="biographie").text)

            photo_tag = soup.find("img", class_="photo")
            url_photo = BASE_URL + photo_tag["src"] if photo_tag else None

            info_blocks = soup.find_all("div", class_="tombStart_infoList")

            domaine = self.clean_text(info_blocks[1].find_all("li")[-1].text)
            date_naissance = self.clean_text(info_blocks[3].find_all("li")[0].text)
            date_deces = self.clean_text(info_blocks[4].find_all("li")[0].text)

            return {
                "nom": nom,
                "domaine": domaine,
                "description": description,
                "biographie": biographie,
                "date_naissance": date_naissance,
                "date_deces": date_deces,
                "url_photo": url_photo
            }

        except Exception as e:
            logging.error(f"Erreur parsing {url} : {e}")
            return None

# -------------------------------------------------
# INSERTION DB
# -------------------------------------------------

def save_to_db(records: List[Dict]):
    conn = get_db_connection()
    cursor = conn.cursor()

    sql = """
        INSERT INTO persons
        (nom, domaine, description, biographie, date_naissance, date_deces, url_photo)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
    """

    values = [
        (
            r["nom"],
            r["domaine"],
            r["description"],
            r["biographie"],
            r["date_naissance"],
            r["date_deces"],
            r["url_photo"]
        )
        for r in records
    ]

    cursor.executemany(sql, values)
    conn.commit()

    cursor.close()
    conn.close()

    logging.info(f"{len(values)} enregistrements insérés")

# -------------------------------------------------
# MAIN
# -------------------------------------------------

def main():
    scraper = PersonalityScraper()
    links = scraper.get_list_links()

    logging.info(f"{len(links)} personnalités trouvées")

    results = []

    for link in links:
        person = scraper.parse_person(link)
        if person:
            results.append(person)
        time.sleep(SLEEP_BETWEEN_REQUESTS)

    save_to_db(results)

if __name__ == "__main__":
    main()
