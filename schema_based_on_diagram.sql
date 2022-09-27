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