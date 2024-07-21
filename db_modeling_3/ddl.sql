CREATE TABLE Documents (
  document_id VARCHAR PRIMARY KEY,
  content TEXT,
  status_id INT,
  created_at TIMESTAMP,
  directory_id VARCHAR,
  FOREIGN KEY (status_id) REFERENCES DocumentStatus(id),
  FOREIGN KEY (directory_id) REFERENCES Directories(directory_id)
);

CREATE TABLE DocumentsEditHistories (
  document_edit_history_id VARCHAR PRIMARY KEY,
  document_id VARCHAR,
  user_id VARCHAR,
  edited_at TIMESTAMP,
  FOREIGN KEY (document_id) REFERENCES Documents(document_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE DocumentStatus (
  id INT PRIMARY KEY,
  status VARCHAR UNIQUE
);

CREATE TABLE Directories (
  directory_id VARCHAR PRIMARY KEY,
  parent_directory_id VARCHAR,
  name VARCHAR,
  created_at TIMESTAMP,
  FOREIGN KEY (parent_directory_id) REFERENCES Directories(directory_id)
);

CREATE TABLE Users (
  user_id VARCHAR PRIMARY KEY,
  name VARCHAR,
  created_at TIMESTAMP
);
