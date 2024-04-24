"use client";
import GetTicket from "./GetTicket";
import React, { useState, useEffect, useContext } from "react";
import Link from "next/link";

const TicketBox = (props) => {
  const [ticket, setTicket] = useState(props.ticket);

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

  const assignMapping = {
    7: "Irvin",
    8: "Zach",
  };

  const contactMapping = {
    0: "System",
    7: "Irvin",
    8: "Zach",
    9: "Alex",
  };

  useEffect(() => {
    if (props.ticket) {
      setTicket({
        ...props.ticket,
        priorityLabel: priorityMapping[props.ticket.ticketPriority],
        statusLabel: statusMapping[props.ticket.ticketStatus],
        assignLabel: assignMapping[props.ticket.assignedToUserId],
        contactLabel: contactMapping[props.ticket.contactUserId],
      });
    }
  }, [props.ticket]);

  return (
    <li className="ticket-list-item">
      <Link href={`/landing/existing-tickets/${props.ticket.ticketId}`}>
        <div className="neu-ticket-box">
          <div className="ticket-box-content">
            <h2 className="ticket-title">
              {props.ticket.title} - {ticket.priorityLabel}
            </h2>
            <p className="ticket-detail">{ticket.statusLabel}</p>
            <p className="ticket-detail">
              {ticket.assignLabel
                ? `Assigned to: ${ticket.assignLabel}`
                : "Unassigned"}
            </p>
          </div>
          <p className="submitted-by">Submitted By: {ticket.contactLabel}</p>
        </div>
      </Link>
      <style jsx>{`
        .ticket-list-item {
          list-style: none; /* Removes bullet points */
          margin-bottom: 10px; /* Space between tickets */
        }

        .neu-ticket-box {
          display: block;
          background-color: #fff; /* Light background color */
          border-radius: 10px; /* Rounded corners */
          padding: 15px; /* Inner spacing */
          box-shadow: 3px 3px 8px rgba(0, 0, 0, 0.15),
            /* Outer shadow */ -3px -3px 8px rgba(255, 255, 255, 0.15); /* Inner light */
          transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
          text-decoration: none; /* Remove link underline */
          color: #333; /* Text color */
        }

        .neu-ticket-box:hover {
          transform: translateY(-2px); /* Slight lift effect */
          box-shadow: 5px 5px 12px rgba(0, 0, 0, 0.2),
            /* Deeper shadow on hover */ -5px -5px 12px rgba(255, 255, 255, 0.2); /* Brighter light on hover */
        }

        .ticket-box-content {
          flex-grow: 1;
        }

        .ticket-title {
          font-size: 1.1rem; /* Title font size */
          font-weight: 600; /* Title font weight */
          margin-bottom: 5px; /* Space between title and detail */
        }

        .ticket-detail {
          font-size: 0.9rem; /* Detail font size */
          color: #666; /* Detail text color */
        }

        .submitted-by {
          font-size: 0.9rem;
          color: #666;
          text-align: right;
        }
      `}</style>
    </li>
  );
};

export default TicketBox;
