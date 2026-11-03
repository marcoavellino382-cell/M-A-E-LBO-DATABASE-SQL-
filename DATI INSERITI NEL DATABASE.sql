-- DATI INSERITI NEL DATABASE 
-- 1. Inserimento azienda Target
INSERT INTO target_companies (ticker, company_name, currency, ebitda, net_income, enterprise_value, free_cash_flow)
VALUES ('CLDN', 'CloudNet Solutions Inc.', 'USD', 25000000, 12000000, 200000000, 18000000);

-- 2. Inserimento fondo Private Equity
INSERT INTO acquirers (acquirer_name, acquirer_type, assets_under_management)
VALUES ('Alpha Capital Partners', 'Private Equity', 5000000000);

-- 3. Inserimento dell'operazione (Deal)
INSERT INTO deals (target_id, acquirer_id, announcement_date, closing_date, deal_status, purchase_price)
VALUES (1, 1, '2026-01-15', '2026-03-01', 'Completed', 180000000);

-- 4. Inserimento delle due tranches di debito
INSERT INTO deal_debt_tranches (deal_id, tranche_name, principal_amount, interest_rate_pct, maturity_years)
VALUES (1, 'Senior Term Loan A', 70000000, 5.5, 7);

INSERT INTO deal_debt_tranches (deal_id, tranche_name, principal_amount, interest_rate_pct, maturity_years)
VALUES (1, 'Mezzanine Subordinated Debt', 38000000, 9.5, 10);