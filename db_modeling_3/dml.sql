INSERT INTO DocumentStatus (id, status) VALUES
(1, 'Draft'),
(2, 'Published'),
(3, 'Archived');

INSERT INTO Users (user_id, name, created_at) VALUES
('user001', '田中太郎', CURRENT_TIMESTAMP),
('user002', '山田二郎', CURRENT_TIMESTAMP);

INSERT INTO Directories (directory_id, parent_directory_id, name, created_at) VALUES
('dir001', NULL, 'Root', CURRENT_TIMESTAMP),
('dir002', 'dir001', 'Subdirectory', CURRENT_TIMESTAMP);

INSERT INTO Documents (document_id, content, status_id, created_at, directory_id) VALUES
('doc001', 'This is the first document.', 1, CURRENT_TIMESTAMP, 'dir001'),
('doc002', 'This is the second document.', 2, CURRENT_TIMESTAMP, 'dir002');

INSERT INTO DocumentsEditHistories (document_edit_history_id, document_id, user_id, edited_at) VALUES
('hist001', 'doc001', 'user001', CURRENT_TIMESTAMP),
('hist002', 'doc002', 'user002', CURRENT_TIMESTAMP);
