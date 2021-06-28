use printoffice;

set foreign_key_checks = 0;

insert into employee (employee_id, first_name, last_name, username, password)
values (1, 'Ad', 'Min', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');
insert into employee (employee_id, first_name, last_name, username, password)
values (2, 'Nikola', 'Jovanovic', 'nikjov', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');
insert into employee (employee_id, first_name, last_name, username, password)
values (3, 'Milica', 'Djuric', 'micy93', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');

insert into client (client_id, first_name, last_name, email, phone)
values (1, 'Predrag', 'Jovic', 'pedja33@gmail.com', '1234567890');
insert into client (client_id, first_name, last_name, email, phone)
values (2, 'Goran', 'Petrovic', 'gpetrovic.67@gmail.com', '1234567890');

insert into document (document_id, deadline, hard_cover, print_instructions)
values (1, '2020-11-05', 0, 'Od 23. do 167. strane');
insert into document (document_id, deadline, hard_cover, print_instructions)
values (2, '2020-11-03', 0, '');
insert into document (document_id, deadline, hard_cover, print_instructions)
values (3, '2020-11-10', 1, '');

insert into print (print_id, printing_machine_id, employee_id, document_id, note, print_date) values (1, 1, 1, 1, '', '2020-11-01');
insert into print (print_id, printing_machine_id, employee_id, document_id, note, print_date) values (2, 3, 2, 2, '', '2020-11-02');
insert into print (print_id, printing_machine_id, employee_id, document_id, note, print_date) values (3, 3, 2, 3, '', '2020-11-03');

insert into printoffice.`order` (order_id, print_id, client_id, paid, price, order_date) values (1, 1, 1, 0, 302.69, '2020-10-28');
insert into printoffice.`order` (order_id, print_id, client_id, paid, price, order_date) values (2, 2, 2, 0, 1203.2, '2020-10-25');
insert into printoffice.`order` (order_id, print_id, client_id, paid, price, order_date) values (3, 3, 2, 0, 749.76, '2020-10-19');

insert into printing_machine (printing_machine_id, make, model, manufacturing_date, description)
values (1,
        'HP',
        'LaserJet Pro M428fdw',
        '2020-10-20',
        'The HP LaserJet Pro M428fdw all-in-one printer lets you scan, copy, print, and fax images and documents so you can easily stay on top of work projects. The 100- and 250-sheet capacity input trays can handle glossy and plain paper as well as cardstock and labels. The 50-sheet automatic feeder lets you scan double-sided documents in a single pass, and the flatbed scanner is great for scanning or copying a single sheet.');
insert into printing_machine (printing_machine_id, make, model, manufacturing_date, description)
values (2,
        'Epson',
        'WorkForce WF-2850',
        '2018-3-12',
        'No description');
insert into printing_machine (printing_machine_id, make, model, manufacturing_date, description)
values (3,
        'Dell',
        'Color Laser Printer C2660dn',
        '2014-1-15',
        'No description');

set foreign_key_checks = 1;
