import axios from "axios";

const getUsers = async () => {
  let response = await axios.get(
    "https://tickettrackrapi.azurewebsites.net/api/User",
    {
      headers: {
        Authorization: `Basic ${btoa("apiuser:abcd#1234")}`,
      },
    }
  );

  return response.data;
};

export default getUsers;
