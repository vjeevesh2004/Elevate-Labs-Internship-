-- Step 2: Insert Sample Data

-- Insert Sections
INSERT INTO Sections (SectionName) VALUES 
('Self-help'), 
('Fiction'), 
('Non-fiction'), 
('Biography'), 
('Science'), 
('History'), 
('Philosophy');

-- Insert Users with Indian Names
INSERT INTO Users (UserName, Email) VALUES 
('Aarav Sharma', 'aarav@le.com'),
('Anaya Verma', 'anaya@kle.com'),
('Vivaan Patel', 'vivaan@abbcde.com'),
('Isha Gupta', 'isha@iokjj.com'),
('Rohan Mehta', 'rohan@ekiiiimple.com');

-- Insert Data into Books Table

INSERT INTO Books (Genre, Title, Author, Price, ISBN, YearOfPublication, NoOfRevisedVersions, SectionID) VALUES 
('Literature', 'The God of Small Things', 'Arundhati Roy', 499.00, '978-9350291657', 1997, 2, 2),
('Biography', 'I Am Malala', 'Malala Yousafzai', 699.00, '978-0316332835', 2013, 1, 4),
('Philosophy', 'The Argumentative Indian', 'Amartya Sen', 599.00, '978-0143031026', 2005, 3, 7),
-- ('Science', 'Indica: A Deep Natural History of the Indian Subcontinent', 'Pranay Lal', 799.00, '978-9386050672', 2019, 0, 5),
('Autobiography', 'Wings of Fire', 'A. P. J. Abdul Kalam', 450.00, '978-8173711467', 1999, 2, 4),
('History', 'An Era of Darkness', 'Shashi Tharoor', 599.00, '978-9385932002', 2017, 1, 6),
('History', 'India: A History', 'Romila Thapar', 750.00, '978-0143030966', 2002, 2, 6),
('History', 'The Discovery of India', 'Jawaharlal Nehru', 500.00, '978-8184951842', 1946, 1, 6),
('Self-help', 'Can’t Hurt Me', 'David Goggins', 699.00, '978-1544512280', 2018, 1, 1),
('Self-help', 'Never Finished', 'David Goggins', 899.00, '978-1544512273', 2022, 0, 1),
('Biography', 'American Sniper', 'Chris Kyle', 599.00, '978-0062246045', 2012, 2, 4),
('Self-help', 'How to Unf**k Yourself', 'Gary John Bishop', 549.00, '978-0062565002', 2018, 1, 1),
('Psychology', 'Mindset', 'Carol S. Dweck', 699.00, '978-0345472328', 2006, 3, 1),
('Self-help', 'How to Win Friends and Influence People', 'Dale Carnegie', 499.00, '978-0671027032', 1936, 15, 1),
('Self-help', 'How to Stop Worrying and Start Living', 'Dale Carnegie', 499.00, '978-0671026462', 1948, 10, 1),
('Self-help', 'How to Talk to Anyone', 'Leil Lowndes', 599.00, '978-0071418584', 2003, 1, 1),
('Self-help', 'The Mountain Is You', 'Brianna Wiest', 699.00, '978-1945795082', 2020, 1, 1),
('Self-help', 'Think and Grow Rich', 'Napoleon Hill', 499.00, '978-1937879507', 1937, 10, 1),
('Self-help', 'The Ego Is the Enemy', 'Ryan Holiday', 599.00, '978-1591847816', 2016, 2, 1),
('Self-help', 'The Subtle Art of Not Giving a F*ck: A Counterintuitive Approach to Living a Good Life', 'Mark Manson', 599.00, '978-0062457714', 2016, 3, 1),
('Psychology', 'Thinking, Fast and Slow', 'Daniel Kahneman', 799.00, '978-0374533557', 2011, 2, 7),
('Self-help', 'The Laws of Human Nature', 'Robert Greene', 899.00, '978-0143124177', 2018, 0, 1),
('Self-help', 'Eat That Frog!', 'Brian Tracy', 499.00, '978-1628654244', 2017, 1, 1),
('Fiction', 'Siddhartha', 'Hermann Hesse', 499.00, '978-0553208849', 1951, 5, 2),
('Fiction', 'The Alchemist', 'Paulo Coelho', 599.00, '978-0062315007', 1993, 7, 2),
('Self-help', 'Who Moved My Cheese?', 'Spencer Johnson', 299.00, '978-0091816971', 1998, 2, 1),
('Self-help', 'Everything Is F*cked: A Book About Hope', 'Mark Manson', 599.00, '978-0062888433', 2019, 1, 1);


-- Insert Purchases
INSERT INTO Purchases (UserID, BookID, PurchaseDate) VALUES 
(1, 1, '2024-11-01'),
(1, 3, '2024-10-30'),
(2, 2, '2024-11-02'),
(3, 5, '2024-11-01'),
(1, 6, '2024-11-02'), -- An Era of Darkness
(2, 8, '2024-11-02'), -- The Discovery of India
(3, 11, '2024-11-02'), -- Can't Hurt Me
(4, 12, '2024-11-01'), -- Never Finished
(5, 14, '2024-11-01'), -- Think and Grow Rich
(1, 1, '2024-11-01'), 
(2, 2, '2024-11-02'), 
(2, 6, '2024-11-02'), 
(2, 9, '2024-11-02'),
(3, 1, '2024-11-03');

-- Insert Interactions
INSERT INTO Interactions (UserID, BookID, InteractionType, InteractionDate) VALUES 
(1, 1, 'view', '2024-11-01'),
(2, 2, 'view', '2024-11-01'),
(1, 3, 'view', '2024-11-02'),
(2, 4, 'view', '2024-11-01'),
(3, 5, 'view', '2024-11-02'),
(1, 6, 'view', '2024-11-02'),
(1, 7, 'view', '2024-11-01'),
(2, 8, 'view', '2024-11-02'),
(3, 9, 'view', '2024-11-01'),
(4, 10, 'view', '2024-11-01'),
(5, 11, 'view', '2024-11-02'),
(3, 12, 'view', '2024-11-01'),
(2, 13, 'view', '2024-11-01'),
(1, 14, 'view', '2024-11-02'),
(1, 15, 'view', '2024-11-01'),
(2, 16, 'view', '2024-11-01'),
(3, 17, 'view', '2024-11-01'),
(4, 18, 'view', '2024-11-01'),
(5, 19, 'view', '2024-11-02'),
(1, 20, 'view', '2024-11-01'),
(2, 21, 'view', '2024-11-01'),
(3, 22, 'view', '2024-11-01'),
(4, 23, 'view', '2024-11-01'),
(1, 1, 'view', '2024-11-01'), 
(2, 1, 'view', '2024-11-01'),
(1, 3, 'view', '2024-11-01'), 
(2, 3, 'view', '2024-11-01'),
(1, 7, 'view', '2024-11-01'),
(5, 24, 'view', '2024-11-01');
