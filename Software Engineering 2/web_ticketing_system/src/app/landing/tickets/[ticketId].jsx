import React, { useRouter, useEffect, useState } from "next/router";
import TicketDetails from "@/Components/TicketDetails";
import axios from "axios";
import { useAsync } from "react-use";

const GetTickets = async (ticketId) => {
  let { data } = axios.get(
    `https://tickettrackrapi.azurewebsites.net/api/Ticket/${ticketId}`,
    {
      headers: {
        Authorization: `Basic ${btoa("apiuser:abcd#1234")}`,
      },
    }
  );

  return data;
};

export default function TicketDetailsPage({ params }) {
  const state = useAsync(
    async () => await GetTickets(params.ticketId),
    [params.ticketId]
  );

  return (
    <>
      {state.loading ? (
        <div>nah fam</div>
      ) : (
        <TicketDetails ticket={state.value} />
      )}
    </>
  );
}
