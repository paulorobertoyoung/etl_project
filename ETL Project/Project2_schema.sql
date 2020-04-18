CREATE TABLE exchange_rates (
	currency VARCHAR PRIMARY KEY,
	exchange_code VARCHAR(10),
	ex_rate_to_EUR FLOAT(10)
);

CREATE TABLE star_data (
	STAR_family VARCHAR PRIMARY KEY,
	market VARCHAR,
	category VARCHAR,
	technology VARCHAR
);

CREATE TABLE order_header(
    po_number BIGINT PRIMARY KEY,
    req_number BIGINT,
    order_date VARCHAR,
    status VARCHAR,
    trans_method VARCHAR
);

CREATE TABLE approval_data (
	document_number INT,
	document_total FLOAT,
	approver VARCHAR,
	delegate VARCHAR,
	approval_limit VARCHAR,
	submission_date VARCHAR,
	first_notification VARCHAR,
	approval_date VARCHAR,
	local_approval_date VARCHAR,
	approval_duration VARCHAR,
	status VARCHAR, 
	note VARCHAR,
	postion INT,
	approval_type VARCHAR,
	approval_chain INT,
	override INT,
	reasons VARCHAR,
	skip_escalation BOOLEAN
);

CREATE TABLE order_line (
	po_number BIGINT,
	PO_Line_Number BIGINT,
	Item_Classification VARCHAR,
	Item_Description VARCHAR,
	Line_Total FLOAT,
	currency VARCHAR,
	Order_Status VARCHAR,
	Order_Transmission_Status VARCHAR,
	Chat_Of_Accounts VARCHAR,
	Account VARCHAR,
	Account_Total_Currency VARCHAR,
	Contract_Number FLOAT,
	ERP VARCHAR,
	FOREIGN KEY (currency) REFERENCES exchange_rates(currency)
);


delete from approval_data;
delete from exchange_rates;
delete from order_header;
delete from order_line;
delete from star_data;

SELECT count(*) from order_header where po_number = 8000015928