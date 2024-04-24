"use client";
import React, { useState, useContext } from "react";
import TicketBox from "./TicketBox";
import { AuthContext } from "@/app/AuthProvider";

const ExistingTickets = (props) => {
  const [filter, setFilter] = useState("all");
  const { user } = useContext(AuthContext);

  const isEmployee = user && user.role === "employee";

  const employeeFilter = (ticket) => {
    if (filter === "all")
      return ticket.contactUserId === user.id && ticket.ticketStatus !== 4;
    if (filter === "completed")
      return ticket.contactUserId === user.id && ticket.ticketStatus === 4;
    return false;
  };

  const generalFilter = (ticket) => {
    if (filter === "all") return ticket.ticketStatus !== 4;
    if (filter === "assignedToMe" && ticket.assignedToUserId === user.id)
      return true;
    if (filter === "unassigned" && !ticket.assignedToUserId) return true;
    if (filter === "completed") return ticket.ticketStatus === 4;
    return false;
  };

  return (
    <div className="flex flex-col items-center justify-center h-screen bg-[#471AA0]">
      <div className="w-3/4 p-10 bg-white bg-opacity-10 backdrop-filter backdrop-blur-lg rounded-3xl shadow-2xl">
        <h1 className="text-3xl font-semibold text-white mb-8 text-center">
          IT Support Request Queue
        </h1>
        {/* Filter buttons */}
        <div className="flex space-x-4 mb-4">
          {!isEmployee && (
            <>
              <button
                className="neu-button"
                onClick={() => setFilter("assignedToMe")}
              >
                Assigned to Me
              </button>
              <button
                className="neu-button"
                onClick={() => setFilter("unassigned")}
              >
                Unassigned
              </button>
            </>
          )}
          <button className="neu-button" onClick={() => setFilter("all")}>
            All Tickets
          </button>
          <button className="neu-button" onClick={() => setFilter("completed")}>
            Completed Tickets
          </button>
        </div>
        {/* Ticket list */}
        <div className="ticket-list-container">
          <div className="space-y-4">
            <ul>
              {props.tickets
                .filter(isEmployee ? employeeFilter : generalFilter)
                .map((ticket) => (
                  <TicketBox ticket={ticket} key={ticket.id} />
                ))}
            </ul>
          </div>
        </div>
      </div>
      <style jsx>{`
        .ticket-list-container {
          max-height: 400px; /* Adjust based on your layout */
          overflow-y: auto; /* Enables vertical scrolling */
        }
        .neu-button {
          background-color: rgba(255, 255, 255, 0.2);
          border-radius: 12px;
          padding: 12px 24px;
          font-size: 0.9rem;
          font-weight: 600;
          color: white;
          border: none;
          cursor: pointer;
          box-shadow: 4px 4px 10px 0 rgba(0, 0, 0, 0.15),
            -4px -4px 10px 0 rgba(255, 255, 255, 0.15);
          transition: all 0.3s ease;
          width: 100%;
        }

        .neu-button:hover {
          background-color: rgba(255, 255, 255, 0.3);
          box-shadow: inset 3px 3px 7px 0 rgba(0, 0, 0, 0.15),
            inset -3px -3px 7px 0 rgba(255, 255, 255, 0.15);
        }

        @media (max-width: 768px) {
          .grid-cols-2 {
            grid-template-columns: 1fr;
          }
        }
      `}</style>
    </div>
  );
};

export default ExistingTickets;
