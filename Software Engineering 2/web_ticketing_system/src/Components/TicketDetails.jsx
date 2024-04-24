"use client";
import React, { useState, useEffect, useContext } from "react";
import axios from "axios";
import { AuthContext } from "../app/AuthProvider";
import UserDropdown from "./UsersDropdown";
import GetTicket from "./GetTicket";

const TicketDetails = (props) => {
  const [isDeleted, setIsDeleted] = useState(false);
  const [ticket, setTicket] = useState(props.ticket);
  const [editMode, setEditMode] = useState(false);
  const [editedTicket, setEditedTicket] = useState({ ...props.ticket });

  const { user } = useContext(AuthContext);

  const isAdmin = user && user.role === "admin";
  const isRep = user && user.role === "rep";
  const isEmployee = user && user.role === "employee";

  const renderEditButton = () => {
    if (isAdmin || isRep) {
      return (
        <>
          <div>
            <button className="edit-button" onClick={() => setEditMode(true)}>
              Edit
            </button>

            <style jsx>{`
              .action-buttons {
                grid-column: 1 / -1; /* Span across all columns */
                display: flex;
                justify-content: start;
                gap: 10px;
                margin-top: 20px;
              }
              .edit-button,
              .delete-button {
                background-color: #4a5568;
                color: white;
                padding: 10px 20px;
                border-radius: 10px;
                border: none;
                cursor: pointer;
                transition: all 0.2s ease;
              }

              .edit-button:hover,
              .delete-button:hover {
                background-color: #2d3748;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
              }
            `}</style>
          </div>
        </>
      );
    }
    return null;
  };

  const renderEditModeContainer = () => {
    if (editMode && (isAdmin || isRep)) {
      return (
        <div className="edit-mode-container">
          <div className="grid-item">
            <span className="info-label">Title:</span>
            <input
              type="text"
              value={editedTicket.title}
              onChange={(e) =>
                setEditedTicket({ ...editedTicket, title: e.target.value })
              }
              className="input-field"
            />
          </div>
          <div className="grid-item">
            <span className="info-label">Description:</span>
            <textarea
              value={editedTicket.description}
              onChange={(e) =>
                setEditedTicket({
                  ...editedTicket,
                  description: e.target.value,
                })
              }
              className="textarea-field"
            />
          </div>
          <div className="grid-item">
            <span className="status-label">Current Status:</span>
            <select
              className="dropdown-field"
              value={editedTicket.ticketStatus}
              onChange={handleStatusSelect}
            >
              <option value="1">New</option>
              <option value="2">In-Process</option>
              <option value="3">On-Hold</option>
              <option value="4">Completed</option>
            </select>
          </div>
          <div className="grid-item">
            <span className="info-label">Internal Notes:</span>
            <textarea
              value={editedTicket.internalNotes}
              onChange={(e) =>
                setEditedTicket({
                  ...editedTicket,
                  internalNotes: e.target.value,
                })
              }
              className="textarea-field"
            />
          </div>
          <div className="grid-item">
            <span className="info-label">Assigned To:</span>
            <UserDropdown
              onChange={handleUserSelect}
              className="dropdown-field"
              selectedUserId={editedTicket.assignedToUserId}
            />
          </div>
          <div className="action-buttons">
            <button onClick={saveEdits} className="save-button">
              Save
            </button>
            <button
              onClick={() => setEditMode(false)}
              className="cancel-button"
            >
              Cancel
            </button>
          </div>
          <style jsx>{`
            .ticket-details-container {
              max-width: 1000px;
              margin: auto;
              padding: 20px;
              background-color: #f5f5f5;
              border-radius: 15px;
              box-shadow: 3px 3px 8px rgba(0, 0, 0, 0.2),
                -3px -3px 8px rgba(255, 255, 255, 0.2);
            }

            .content-container {
              display: flex;
              flex-direction: column;
            }

            .form-section {
              margin-bottom: 20px;
            }

            .edit-mode-container {
              display: grid;
              grid-template-columns: repeat(2, 1fr);
              gap: 10px;
            }

            .grid-item {
              padding: 10px;
              background-color: #f5f5f5;
              border-radius: 8px;
              box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .input-field,
            .textarea-field,
            .dropdown-field {
              width: 100%;
              padding: 10px;
              margin-top: 5px;
              border-radius: 8px;
              border: 1px solid #ddd;
              box-shadow: inset 2px 2px 5px rgba(0, 0, 0, 0.1);
            }

            .textarea-field {
              height: 120px; /* Adjust height as needed */
            }

            .action-buttons {
              grid-column: 1 / -1; /* Span across all columns */
              display: flex;
              justify-content: start;
              gap: 10px;
              margin-top: 20px;
            }

            .save-button,
            .cancel-button {
              background-color: #4a5568;
              color: white;
              padding: 10px 20px;
              margin-right: 10px;
              border-radius: 10px;
              border: none;
              cursor: pointer;
              transition: all 0.2s ease;
            }

            .save-button:hover,
            .cancel-button:hover,
            .bg-blue-500:hover,
            .bg-red-500:hover {
              background-color: #2d3748;
              box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            }

            .ticket-title {
              font-size: 1.8rem;
              color: #333;
              margin-bottom: 20px;
            }

            .ticket-info-grid {
              display: grid;
              grid-template-columns: repeat(2, 1fr);
              gap: 10px;
              margin-bottom: 20px;
            }

            .grid-item {
              padding: 10px;
              background-color: #f5f5f5;
              border-radius: 8px;
              box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .description {
              grid-column: 1 / -1;
            }

            .info-label {
              font-weight: 600;
            }

            .action-buttons {
              display: flex;
              justify-content: start;
              gap: 10px;
              margin-top: 20px;
            }

            .edit-button,
            .delete-button {
              background-color: #4a5568;
              color: white;
              padding: 10px 20px;
              border-radius: 10px;
              border: none;
              cursor: pointer;
              transition: all 0.2s ease;
            }

            .edit-button:hover,
            .delete-button:hover {
              background-color: #2d3748;
              box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            }
          `}</style>
        </div>
      );
    }
    return null;
  };

  useEffect(() => {
    console.log("Logged in user:", user);
  }, [user]);

  const priorityMapping = {
    1: "Low",
    2: "Medium",
    3: "High",
    4: "Urgent",
  };

  const statusMapping = {
    1: "New",
    2: "In-Process",
    3: "On-Hold",
    4: "Completed",
  };

  const fetchTicket = async () => {
    try {
      const data = await GetTicket(props.ticket.ticketId);
      setTicket(data);
    } catch (error) {
      console.error("Error fetching ticket:", error);
    }
  };

  useEffect(() => {
    if (props.ticket) {
      setTicket({
        ...props.ticket,
        priorityLabel: priorityMapping[props.ticket.ticketPriority],
        statusLabel: statusMapping[props.ticket.ticketStatus],
      });
    }
  }, [props.ticket]);

  const deleteTicket = async () => {
    try {
      await axios.delete(
        `https://tickettrackrapi.azurewebsites.net/api/Ticket/${props.ticket.ticketId}`,
        {
          headers: {
            Authorization: `Basic ${btoa("apiuser:abcd#1234")}`, // Update with correct authorization if needed
          },
        }
      );
      console.log("Ticket deleted successfully");
      setIsDeleted(true);
    } catch (error) {
      console.error("Error deleting ticket", error);
    }
  };

  const saveEdits = async () => {
    try {
      const currentDateTime = new Date().toISOString();
      const updatedTicket = {
        ...editedTicket,
        lastModifiedTime: currentDateTime,
        ticketStatus: editedTicket.ticketStatus,
      };

      const response = await axios.put(
        `https://tickettrackrapi.azurewebsites.net/api/Ticket/${ticket.ticketId}`,
        editedTicket,
        {
          headers: {
            Authorization: `Basic ${btoa("apiuser:abcd#1234")}`,
          },
        }
      );

      console.log("Ticket updated successfully", response.data);
      await fetchTicket();
      setTicket(updatedTicket);
      window.location.reload();
    } catch (error) {
      console.error("Error updating ticket", error);
    }
  };

  if (!props.ticket) {
    return <div>Loading...</div>;
  }

  const handleUserSelect = (e) => {
    const userId = e.target.value;
    console.log("Selected UserId:", userId);
    setEditedTicket((prevTicket) => ({
      ...prevTicket,
      assignedToUserId: userId,
    }));
  };

  const handleStatusSelect = (e) => {
    setEditedTicket((prevTicket) => ({
      ...prevTicket,
      ticketStatus: parseInt(e.target.value, 10),
    }));
  };

  return (
    <div className="ticket-details-container">
      <div className="content-container">
        {renderEditModeContainer()}
        {!editMode && (
          <>
            <h1 className="ticket-title">{props.ticket.title}</h1>

            <div className="ticket-info-grid">
              <div className="grid-item">
                <span className="info-label">Ticket #:</span>{" "}
                {props.ticket.ticketId}
              </div>
              <div className="grid-item">
                <span className="info-label">From:</span>{" "}
                {props.ticket.contactUserId}
              </div>
              <div className="grid-item">
                <span className="info-label">Opened:</span>{" "}
                {props.ticket.openedDate}
              </div>
              <div className="grid-item">
                <span className="info-label">Priority:</span>{" "}
                {ticket.priorityLabel}
              </div>
              <div className="grid-item">
                <span className="info-label">Assigned To:</span>{" "}
                {props.ticket.assignedToUserId}
              </div>
              <div className="grid-item">
                <span className="info-label">Status:</span> {ticket.statusLabel}
              </div>
              <div className="grid-item description">
                <span className="info-label">Description:</span>{" "}
                {props.ticket.description}
              </div>
              {(isAdmin || isRep) && (
                <div className="grid-item">
                  <span className="info-label">Internal Notes:</span>{" "}
                  {props.ticket.internalNotes}
                </div>
              )}
              <div className="grid-item">
                <span className="info-label">Last Edited:</span>{" "}
                {props.ticket.lastModifiedTime} by{" "}
                {props.ticket.lastModifiedByUserId}
              </div>
            </div>
            <div className="action-buttons">
              {renderEditButton()}
              {isAdmin && (
                <button className="delete-button" onClick={deleteTicket}>
                  Delete Ticket
                </button>
              )}
            </div>
          </>
        )}
      </div>
      <style jsx>{`
        .ticket-details-container {
          max-width: 1000px;
          margin: auto;
          padding: 20px;
          background-color: #f5f5f5;
          border-radius: 15px;
          box-shadow: 3px 3px 8px rgba(0, 0, 0, 0.2),
            -3px -3px 8px rgba(255, 255, 255, 0.2);
        }

        .content-container {
          display: flex;
          flex-direction: column;
        }

        .form-section {
          margin-bottom: 20px;
        }

        .edit-mode-container {
          display: grid;
          grid-template-columns: repeat(2, 1fr);
          gap: 10px;
        }

        .grid-item {
          padding: 10px;
          background-color: #f5f5f5;
          border-radius: 8px;
          box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .input-field,
        .textarea-field,
        .dropdown-field {
          width: 100%;
          padding: 10px;
          margin-top: 5px;
          border-radius: 8px;
          border: 1px solid #ddd;
          box-shadow: inset 2px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .textarea-field {
          height: 120px; /* Adjust height as needed */
        }

        .action-buttons {
          grid-column: 1 / -1; /* Span across all columns */
          display: flex;
          justify-content: start;
          gap: 10px;
          margin-top: 20px;
        }

        .save-button,
        .cancel-button {
          background-color: #4a5568;
          color: white;
          padding: 10px 20px;
          margin-right: 10px;
          border-radius: 10px;
          border: none;
          cursor: pointer;
          transition: all 0.2s ease;
        }

        .save-button:hover,
        .cancel-button:hover,
        .bg-blue-500:hover,
        .bg-red-500:hover {
          background-color: #2d3748;
          box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .ticket-title {
          font-size: 1.8rem;
          color: #333;
          margin-bottom: 20px;
        }

        .ticket-info-grid {
          display: grid;
          grid-template-columns: repeat(2, 1fr);
          gap: 10px;
          margin-bottom: 20px;
        }

        .grid-item {
          padding: 10px;
          background-color: #f5f5f5;
          border-radius: 8px;
          box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .description {
          grid-column: 1 / -1;
        }

        .info-label {
          font-weight: 600;
        }

        .action-buttons {
          display: flex;
          justify-content: start;
          gap: 10px;
          margin-top: 20px;
        }

        .edit-button,
        .delete-button {
          background-color: #4a5568;
          color: white;
          padding: 10px 20px;
          border-radius: 10px;
          border: none;
          cursor: pointer;
          transition: all 0.2s ease;
        }

        .edit-button:hover,
        .delete-button:hover {
          background-color: #2d3748;
          box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }
      `}</style>
    </div>
  );
};

export default TicketDetails;
