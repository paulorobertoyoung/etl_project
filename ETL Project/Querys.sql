SELECT * FROM old_order_line
INNER JOIN order_header
ON old_order_line.po_number = order_header.po_number;

SELECT * FROM old_order_line
INNER JOIN order_header
ON old_order_line.po_number = order_header.po_number
where old_order_line.po_number ='8000015928';

Copy (SELECT * FROM old_order_line
INNER JOIN order_header
ON old_order_line.po_number = order_header.po_number)
To 'C:\Users\[UserName]\Desktop\Join777.csv' With CSV DELIMITER ','  HEADER;

ALTER TABLE order_line
ADD CONSTRAINT constraint_fk
FOREIGN KEY (po_number)
REFERENCES order_header("po_number")
ON DELETE CASCADE;