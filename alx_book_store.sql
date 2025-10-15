-- Create a table for the bookstore

-- Books: Stores information about books available in the bookstore.
CREATE TABLE books (
    book_id INT PRIMARY KEY NOT NULL,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DECIMAL(7, 2) NOT NULL,
    publication_date DATE NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Authors: Stores information about authors.
CREATE TABLE authors (
    author_id INT PRIMARY KEY NOT NULL,
    author_name VARCHAR(215) NOT NULL
);

-- Customers: Stores information about customers.
CREATE TABLE customers (
    customer_id INT PRIMARY KEY NOT NULL,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT NOT NULL
);

-- Orders: Stores information about orders placed by customers.
CREATE TABLE orders (
    order_id INT PRIMARY KEY NOT NULL,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order_Details: Stores information about the books included in each order.
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY NOT NULL,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
