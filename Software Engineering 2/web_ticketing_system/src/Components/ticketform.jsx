"use client";
import { useContext, useState } from "react";
import axios from "axios";
import { AuthContext } from "../context/AuthContext";

const TicketForm = (props) => {
  const [formData, setFormData] = useState({
    title: "",
    description: "",
    ticketPriority: 1,
    // ...other fields
  });

  const validateForm = () => {
    if (!formData.title.trim() || !formData.description.trim()) {
      setErrorMessage("Please fill out both the title and description.");
      return false;
    }
    return true;
  };

  const [isSubmitting, setIsSubmitting] = useState(false);
  const [isSubmitted, setIsSubmitted] = useState(false);
  const [errorMessage, setErrorMessage] = useState("");

  const { user } = useContext(AuthContext);

  const resetForm = () => {
    setFormData({
      title: "",
      description: "",
      ticketPriority: 1,
    });

    setIsSubmitted(false);
    setErrorMessage("");
    setIsSubmitting(false);
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    let updatedValue = value;

    if (name === "ticketPriorty") {
      const priorityMap = { Low: 1, Medium: 2, High: 3, Urgent: 4 };
      updatedValue = priorityMap[value];
    }

    setFormData({
      ...formData,
      [name]: updatedValue,
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!validateForm()) {
      return;
    }

    setIsSubmitting(true);
    setErrorMessage("");

    console.log("Form data submitted:", formData);
    await saveToDatabase();

    setIsSubmitting(false);
  };

  const saveToDatabase = async () => {
    setIsSubmitting(true);

    try {
      const currentDateTime = new Date().toISOString();

      const apiData = {
        ...formData,
        openedDate: currentDateTime,
        lastModifiedTime: currentDateTime,
        contactUserId: user ? parseInt(user.id, 10) : undefined,
        lastModifiedByUserId: user ? parseInt(user.id, 10) : undefined,
        ticketStatus: 1,
      };

      const response = await axios.post(
        "https://tickettrackrapi.azurewebsites.net/api/Ticket",
        apiData,
        {
          headers: {
            Authorization: `Basic ${btoa("apiuser:abcd#1234")}`,
          },
        }
      );

      console.log("Ticket successfully saved", response.data);
      setIsSubmitted(true);
      setErrorMessage("");
    } catch (error) {
      console.error("Failed to save ticket", error);
      setErrorMessage("Error: Failed to submit ticket");
      setIsSubmitted(false);
    }

    setIsSubmitting(false);
  };

  return (
    <div className="flex justify-center items-center min-h-screen bg-[#471AA0]">
      <div className="w-full max-w-lg p-10 bg-white bg-opacity-10 backdrop-filter backdrop-blur-lg rounded-3xl shadow-2xl">
        <h2 className="text-3xl font-semibold text-white mb-8 text-center">
          New Ticket
        </h2>
        {!isSubmitted ? (
          <form className="neu-form" onSubmit={handleSubmit}>
            <div className="flex flex-wrap mb-6">
              <div className="w-full mb-4">
                <label
                  className="block text-white text-sm font-bold mb-2"
                  htmlFor="grid-ticket-title"
                >
                  Ticket Title
                </label>
                <input
                  className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                  id="title"
                  type="text"
                  placeholder="Title"
                  name="title"
                  value={formData.title}
                  onChange={handleInputChange}
                />
              </div>

              <div className="w-full mb-4">
                <label
                  className="block text-white text-sm font-bold mb-2"
                  htmlFor="grid-description"
                >
                  Describe Your Issue
                </label>
                <textarea
                  className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                  id="description"
                  placeholder="Describe Issue Here"
                  name="description"
                  value={formData.description}
                  onChange={handleInputChange}
                ></textarea>
              </div>
            </div>

            <div className="flex flex-wrap mb-4">
              <div className="w-full md:w-2/3 mb-4">
                <label
                  className="block text-white text-sm font-bold mb-2"
                  htmlFor="grid-priority"
                >
                  Priority
                </label>
                <select
                  className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                  id="ticketPriority"
                  name="ticketPriority"
                  value={formData.ticketPriority}
                  onChange={handleInputChange}
                >
                  <option value="1">Low</option>
                  <option value="2">Medium</option>
                  <option value="3">High</option>
                  <option value="4">Urgent</option>
                </select>
              </div>
            </div>

            <div className="flex justify-start mt-8">
              <button
                className="neu-button"
                type="submit"
                disabled={isSubmitting}
              >
                {isSubmitting ? "Submitting..." : "Submit"}
              </button>
            </div>
          </form>
        ) : (
          <>
            <div className="success-message">
              Ticket successfully submitted!
            </div>
            <button className="neu-button" onClick={resetForm}>
              Submit New Ticket
            </button>
          </>
        )}

        {errorMessage && <div className="error-message">{errorMessage}</div>}
      </div>
      <style jsx>{`
        .neu-form input,
        .neu-form textarea,
        .neu-form select {
          background-color: rgba(255, 255, 255, 0.1);
          border-radius: 12px;
          padding: 12px 20px;
          font-size: 1rem;
          color: white;
          border: none;
          box-shadow: inset 3px 3px 8px 0 rgba(0, 0, 0, 0.2),
            inset -3px -3px 8px 0 rgba(255, 255, 255, 0.1);
          outline: none;
          transition: all 0.2s ease-in-out;
        }

        .neu-form input:focus,
        .neu-form textarea:focus,
        .neu-form select:focus {
          box-shadow: inset 1px 1px 4px 0 rgba(0, 0, 0, 0.3),
            inset -1px -1px 4px 0 rgba(255, 255, 255, 0.2);
        }

        .neu-button {
          background-color: rgba(255, 255, 255, 0.1);
          border-radius: 12px;
          padding: 12px 30px;
          font-size: 1.25rem;
          font-weight: 600;
          color: white;
          border: none;
          cursor: pointer;
          box-shadow: 4px 4px 10px 0 rgba(0, 0, 0, 0.2),
            -4px -4px 10px 0 rgba(255, 255, 255, 0.1);
          transition: all 0.3s ease;
        }

        .neu-button:hover {
          box-shadow: inset 5px 5px 10px 0 rgba(0, 0, 0, 0.2),
            inset -5px -5px 10px 0 rgba(255, 255, 255, 0.1);
        }

        .neu-button:hover:not(:disabled) {
          box-shadow: inset 5px 5px 10px 0 rgba(0, 0, 0, 0.2),
            inset -5px -5px 10px 0 rgba(255, 255, 255, 0.1);
        }

        .neu-button:disabled {
          opacity: 0.5; // Optional: change appearance of the button when disabled
          cursor: default;
        }

        .success-message {
          color: green;
          margin-top: 20px;
          text-align: center;
          font-weight: bold;
        }

        .error-message {
          color: red;
          margin-top: 20px;
          text-align: center;
          font-weight: bold;
        }
      `}</style>
    </div>
  );
};

export default TicketForm;
