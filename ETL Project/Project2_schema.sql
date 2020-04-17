CREATE TABLE exchange_rates (
	exchange_code VARCHAR(10) PRIMARY KEY,
	currency VARCHAR(3),
	ex_rate_to_EUR FLOAT(10)
);

CREATE TABLE star_data (
	STAR_family VARCHAR(5) PRIMARY KEY,
	market VARCHAR(5),
	category(5) VARCHAR,
	technology(5) VARCHAR
);

CREATE TABLE approval_data (
	document_number INT,
	document_total FLOAT,
	approver VARCHAR,
	delegate VARCHAR,
	approval_limit FLOAT,
	submission_date DATE,
	first_notification DATE,
	approval_date DATE,
	local_approval_date DATE,
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

CREATE TABLE order_header(
    po_number CHAR(15) PRIMARY KEY,
    req_number CHAR(15),
    order_date CHAR(15),
    status CHAR(15),
    trans_method CHAR(20),
	FOREIGN KEY (req_number) REFERENCES approval_data(document_number)
);

CREATE TABLE order_line (
	po_number INT,
	PO_Line_Number DATE,
	Item_Classification VARCHAR,
	Item_Description VARCHAR,
	Line_Total INT,
	currency VARCHAR (3),
	Order_Status VARCHAR,
	Order_Transmission_Status VARCHAR,
	Chat_Of_Accounts VARCHAR,
	Account VARCHAR,
	Account_Total_Currency VARCHAR (3),
	Contract_Number VARCHAR,
	ERP VARCHAR(3),
	FOREIGN KEY (po_number) REFERENCES order_header(po_number),
	FOREIGN KEY (currency) REFERENCES exchange_rates(currency),
);
