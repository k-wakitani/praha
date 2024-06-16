CREATE TABLE Users (
    user_id VARCHAR PRIMARY KEY,
    user_name VARCHAR,
    user_email VARCHAR,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Workspaces (
    workspace_id VARCHAR PRIMARY KEY,
    workspace_name VARCHAR,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE WorkspacesEnrollments (
    user_id VARCHAR PRIMARY KEY,
    workspace_id VARCHAR PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (workspace_id) REFERENCES Workspaces(workspace_id)
);

CREATE TABLE Channels (
    channel_id VARCHAR PRIMARY KEY,
    channel_name VARCHAR NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ChannelEnrollments (
    user_id VARCHAR PRIMARY KEY,
    channel_id VARCHAR PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY user_id REFERENCES Users(user_id),
    FOREIGN KEY channel_id REFERENCES Channels(channel_id)
);

CREATE TABLE Messages (
    message_id VARCHAR PRIMARY KEY,
    content TEXT,
    channel_id VARCHAR,
    user_id VARCHAR,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY channel_id REFERENCES Channels(channel_id)
)

CREATE TABLE Threads (
    thread_id VARCHAR PRIMARY KEY,
    message_id VARCHAR,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY message_id REFERENCES Messages(message_id)
)