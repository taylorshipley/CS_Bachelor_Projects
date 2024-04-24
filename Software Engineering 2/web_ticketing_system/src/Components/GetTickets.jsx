import axios from "axios";

const getTickets = async () => {
  let response = await axios.get(
    "https://tickettrackrapi.azurewebsites.net/api/Ticket",
    {
      headers: {
        Authorization: `Basic ${btoa("apiuser:abcd#1234")}`,
      },
    }
  );

  return response.data;
};

export default getTickets;
