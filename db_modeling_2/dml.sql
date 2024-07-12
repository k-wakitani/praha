INSERT INTO Users (user_id, user_name, user_email) VALUES
('user1', '田中太郎', 'tanaka@example.com'),
('user2', '伊藤花子', 'ito@example.com'),
('user3', '山田太郎', 'yamada@example.com');

INSERT INTO Workspaces (workspace_id, workspace_name) VALUES
('workspace1', 'Workspace Alpha'),
('workspace2', 'Workspace Beta');

INSERT INTO WorkspaceEnrollments (user_id, workspace_id) VALUES
('user1', 'workspace1'),
('user2', 'workspace1'),
('user3', 'workspace2');

INSERT INTO Channels (channel_id, channel_name) VALUES
('channel1', 'General'),
('channel2', 'Random'),
('channel3', 'Development');

INSERT INTO ChannelEnrollments (user_id, channel_id) VALUES
('user1', 'channel1'),
('user2', 'channel2'),
('user3', 'channel1'),
('user1', 'channel3');

INSERT INTO Messages (message_id, content, channel_id, user_id) VALUES
('message1', 'こんにちは', 'channel1', 'user1'),
('message2', 'こんにちは！', 'channel2', 'user2'),
('message3', 'さようなら', 'channel1', 'user3');

INSERT INTO Threads (thread_id, message_id) VALUES
('thread1', 'message1'),
('thread2', 'message3');
