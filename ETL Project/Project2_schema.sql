CREATE TABLE exchange_rates (
	"currency" VARCHAR PRIMARY KEY,
	"exchange_code" VARCHAR,
	"exchange_rate_to_eur" FLOAT
);

CREATE TABLE star_data (
	"star_family" VARCHAR PRIMARY KEY,
    "market" VARCHAR,
	"category" VARCHAR,
	"technology" VARCHAR
);

CREATE TABLE order_header(
    "po_number" BIGINT PRIMARY KEY,
    "requisition_number" BIGINT,
    "order_date" VARCHAR,
    "status" VARCHAR,
    "transmission_method" VARCHAR
);


CREATE TABLE approval_data (
	"document_number" INT,
	"document_total" FLOAT,
	"approver" VARCHAR,
	"delegates" VARCHAR,
	"approval_limit" VARCHAR,
	"submission_date" TIMESTAMP,
	"first_notification" TIMESTAMP,
	"approval_date" TIMESTAMP,
	"local_approval_date" TIMESTAMP,
	"approval_duration" VARCHAR,
	"status" VARCHAR, 
	"note" VARCHAR,
	"position" INT,
	"type" VARCHAR,
	"approval_chain" INT,
	"override" INT,
	"reasons" VARCHAR,
	"skip_escalation" BOOLEAN
);

CREATE TABLE order_line (
    "po_key" VARCHAR PRIMARY KEY,
    "po_number" BIGINT,
	"line" BIGINT,
    "order_status" VARCHAR,
    "transmission_method" VARCHAR,
	"item" VARCHAR,
	"line_total" FLOAT,
	"currency" VARCHAR,
	"account" VARCHAR,
	"chart_of_accounts" VARCHAR,
	"contract_number" FLOAT,
	"erp" VARCHAR,
	"item_classification" VARCHAR,
	"accounting_total_currency" VARCHAR
);




ALTER TABLE order_line
ADD CONSTRAINT constraint_fk
FOREIGN KEY (po_number)
REFERENCES order_header("PO Number")
ON DELETE CASCADE;





select * from order_line
