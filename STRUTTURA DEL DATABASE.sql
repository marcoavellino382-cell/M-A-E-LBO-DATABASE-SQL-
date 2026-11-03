-- STRUTTURA DEL DATABASE 

-- Attiva il supporto alle Foreign Key su SQ lite (eseguire a ogni connessione9 )
PRAGMA foreign_keys = ON; 

-- 1. TABELLA AZIENDE TARGET 
CREATE TABLE target_companies (
target_id INTEGER PRIMARY KEY AUTOINCREMENT, 
ticker TEXT UNIQUE, 
company_name TEXT NOT NULL, 
currency TEXT DEFAULT 'USD', 
ebitda REAL NOT NULL, 
net_income REAL NOT NULL, 
enterprise_value REAL NOT NULL, 
free_cash_flow REAL NOT NULL
); 

-- 2. TABELLA ACQUIRENTI 
CREATE TABLE acquires ( 
acquirer_id INTEGER PRIMARY KEY AUTOINCREMENT, 
acquirer_name TEXT NOT NULL, 
acquirer_type TEXT CHECK(acquirer_type IN ('Private Equity', 'Strategic Corporate')), 
assets_under_management REAL 
); 

-- 3. TABELLA OPERAZIONI/DEALS 
CREATE TABLE deals ( 
deal_id INTEGER PRIMARY KEY AUTOINCREMENT, 
target_id INTEGER NOT NULL, 
acquirer_id INTEGER NOT NULL, 
announcement_date TEXT NOT NULL, 
closing_date TEXT, 
deal_status TEXT CHECK(deal_status IN ('Announced', 'Completed', 'Cancelled')) DEFAULT 'Announced', 
purchase_price REAL NOT NULL, 
FOREIGN KEY (target_id) REFERENCES target_companies(target_id) ON DELETE CASCADE, 
FOREIGN KEY (acquirer_id) REFERENCES acquirers(acquirer_id) ON DELETE CASCADE 
);

-- 4. TABELLA TRANCHES DI DEBITO (leva finanziaria del buyout) 
CREATE TABLE deal_debt_tranches (
tranche_id INTEGER PRIMARY KEY AUTOINCREMENT, 
deal_id INTEGER NOT NULL, 
tranche_name TEXT NOT NULL, 
principal_amount REAL NOT NULL, -- Ammontare del debito annuo 
interest_rate_pct REAL NOT NULL, -- Tasso di interesse annuo 
maturity_years INTEGER NOT NULL, -- Durata del debito in anni 
FOREIGN KEY (deal_id) REFERENCES deals(deal_id) ON DELETE CASCADE 
); 