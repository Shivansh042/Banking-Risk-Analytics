CREATE TABLE public.clients 
(    
	client_id               INT PRIMARY KEY,
    name                    VARCHAR(150),
    age                     INT,
    location_id             INT,
    joined_bank             DATE,
    banking_contact         VARCHAR(150),
    nationality             VARCHAR(100),
    occupation              VARCHAR(100),
    gender                  VARCHAR(20),
    loyalty_classification  VARCHAR(50),
    estimated_income        NUMERIC(15,2),
    superannuation_savings  NUMERIC(15,2),
    total_credit_cards      INT,
    credit_card_balance     NUMERIC(15,2),
    bank_loans              NUMERIC(15,2),
    bank_deposits           NUMERIC(15,2),
    checking_accounts       INT,
    saving_accounts         INT,
    foreign_currency_account NUMERIC(15,2),
    business_lending        NUMERIC(15,2),
    properties_owned        INT,
    risk_weighting          NUMERIC(10,2),
    br_id                   INT,
    ia_id                   INT
);

CREATE TABLE public.relationships (
    br_id INT PRIMARY KEY,
    banking_relationship VARCHAR(100)
);

ALTER TABLE public.clients
ADD CONSTRAINT fk_clients_relationships
FOREIGN KEY (br_id)
REFERENCES public.relationships (br_id);

CREATE TABLE public.advisor (
    ia_id INT PRIMARY KEY,
    investment_advisor VARCHAR(150)
);

ALTER TABLE public.clients
ADD CONSTRAINT fk_clients_advisor
FOREIGN KEY (ia_id)
REFERENCES public.advisor (ia_id);

ALTER TABLE clients
ALTER COLUMN client_id TYPE varchar(50);

ALTER TABLE clients
ALTER COLUMN checking_accounts TYPE numeric(15,2);

ALTER TABLE clients
ALTER COLUMN saving_accounts TYPE numeric(15,2);

ALTER TABLE clients
DROP CONSTRAINT clients_pkey;


