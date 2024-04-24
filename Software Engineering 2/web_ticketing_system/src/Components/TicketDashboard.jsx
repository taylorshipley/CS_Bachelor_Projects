import React from "react";
import Link from "next/link";

const TicketDashboard = () => {
  return (
    <div className="flex flex-col items-center justify-center h-screen bg-[#471AA0] p-4">
      <div className="w-full max-w-2xl bg-white bg-opacity-25 backdrop-filter backdrop-blur-lg p-8 rounded-3xl shadow-2xl flex flex-col items-center justify-center">
        <h1 className="text-4xl font-bold text-gray-200 mb-6 text-center">
          Ticket Dashboard
        </h1>
        <img
          src="/logo-no-background.svg"
          alt="logo"
          className="logo-class"
          style={{ width: "100px", height: "100px" }}
        />
        <div className="grid grid-cols-2 gap-4 mt-6">
          <Link href="/landing/new-ticket/">
            <button className="neu-button">Create New Ticket</button>
          </Link>
          <Link href="/landing/existing-tickets/">
            <button className="neu-button">View Existing Tickets</button>
          </Link>
        </div>
      </div>
      <style jsx>{`
        .neu-button {
          background-color: rgba(255, 255, 255, 0.2);
          border-radius: 12px;
          padding: 12px 24px;
          font-size: 1.15rem;
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

export default TicketDashboard;
