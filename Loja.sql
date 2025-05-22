--// Portugues 
--// Tabela para registrar os profissionais 
CREATE TABLE Artesoes ( 
    ID_Artesao INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Contato VARCHAR(100),
    Endereco TEXT,
    Tipo_Artesanato VARCHAR(100),
    Data_Cadastro DATE
);

--// Tabela para registrar os produtos feitos 
CREATE TABLE Produtos (
    ID_Produto INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Categoria_ID INT,
    Preco DECIMAL(10,2) NOT NULL,
    Quantidade_Estoque INT DEFAULT 0,
    Artesao_ID INT,
    FOREIGN KEY (Categoria_ID) REFERENCES Categorias(ID_Categoria),
    FOREIGN KEY (Artesao_ID) REFERENCES Artesoes(ID_Artesao)
);

--// Tabela para registrar os clientes 
CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Telefone VARCHAR(20),
    Endereco TEXT,
    Data_Cadastro DATE
);

--//Tabela que registra as vendas feitas 
CREATE TABLE Vendas (
    ID_Venda INT PRIMARY KEY AUTO_INCREMENT,
    Cliente_ID INT,
    Data_Venda DATETIME,
    Valor_Total DECIMAL(10,2),
    Forma_Pagamento VARCHAR(50),
    Status VARCHAR(20),
    FOREIGN KEY (Cliente_ID) REFERENCES Clientes(ID_Cliente)
);
--// Tabela que registra os itens vendidos 
CREATE TABLE Itens_Venda (
    ID_Item INT PRIMARY KEY AUTO_INCREMENT,
    Venda_ID INT,
    Produto_ID INT,
    Quantidade INT,
    Preco_Unitario DECIMAL(10,2),
    Subtotal DECIMAL(10,2),
    FOREIGN KEY (Venda_ID) REFERENCES Vendas(ID_Venda),
    FOREIGN KEY (Produto_ID) REFERENCES Produtos(ID_Produto)
);

--// Ingles 

-- Table for registering artisans
CREATE TABLE Artisans ( 
    ID_Artisan INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Contact VARCHAR(100),
    Address TEXT,
    Craft_Type VARCHAR(100),
    Registration_Date DATE
);

-- Table for registering the products made
CREATE TABLE Products (
    ID_Product INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Category_ID INT,
    Price DECIMAL(10,2) NOT NULL,
    Stock_Quantity INT DEFAULT 0,
    Artisan_ID INT,
    FOREIGN KEY (Category_ID) REFERENCES Categories(ID_Category),
    FOREIGN KEY (Artisan_ID) REFERENCES Artisans(ID_Artisan)
);

-- Table for registering customers
CREATE TABLE Customers (
    ID_Customer INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address TEXT,
    Registration_Date DATE
);

-- Table that records sales made
CREATE TABLE Sales (
    ID_Sale INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT,
    Sale_Date DATETIME,
    Total_Amount DECIMAL(10,2),
    Payment_Method VARCHAR(50),
    Status VARCHAR(20),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(ID_Customer)
);

-- Table that records sold items
CREATE TABLE Sale_Items (
    ID_Item INT PRIMARY KEY AUTO_INCREMENT,
    Sale_ID INT,
    Product_ID INT,
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Subtotal DECIMAL(10,2),
    FOREIGN KEY (Sale_ID) REFERENCES Sales(ID_Sale),
    FOREIGN KEY (Product_ID) REFERENCES Products(ID_Product)
);