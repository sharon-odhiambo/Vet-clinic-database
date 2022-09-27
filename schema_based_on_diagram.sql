CREATE TABLE patients (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY, 
    name varchar(20) NOT NULL,
    date_of_birth date NOT NULL, 
    PRIMARY KEY (id)
    );
CREATE TABLE medical_histories (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY, 
    admitted_at timestamp,
    patient_id INT NOT NULL REFERENCES patients (id),
    status VARCHAR,
    PRIMARY KEY (id)
   );
CREATE TABLE invoices (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY, 
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id INT NOT NULL REFERENCES medical_histories (id),
    PRIMARY KEY (id)
   );
   CREATE TABLE treatments ( id INT NOT NULL GENERATED ALWAYS AS IDENTITY, type VARCHAR NOT NULL, name VARCHAR(20), PRIMARY KEY (id) );
   CREATE TABLE invoice_items ( id INT NOT NULL GENERATED ALWAYS AS IDENTITY, unit_price decimal, quantity int, total_price decimal, invoice_id INT NOT NULL REFERENCES invoices (id), treatment_id INT NOT NULL REFERENCES treatments (id), PRIMARY KEY (id) ); 
