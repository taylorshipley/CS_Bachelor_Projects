import axios from "axios";

const GetTicket = async (ticketId) => {
  try {
    let response = await axios.get(
      `https://tickettrackrapi.azurewebsites.net/api/Ticket/${ticketId}`,
      {
        headers: {
          Authorization: `Basic ${btoa("apiuser:abcd#1234")}`,
        },
      }
    );
    return response.data;
  } catch (error) {
    console.error("Error fetching ticket:", error);
    throw error; 
  }
};

export default GetTicket;
