// Import necessary libraries and components
import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import ExistingTickets from '../ExisitingTickets';
import '@testing-library/jest-dom';
import axios from "axios";

// Test suite for ExistingTickets component
describe('ExistingTickets Component', () => {

    // Mock the axios get request
    jest.mock('axios');

    // Mock the tickets
    const tickets = [
        {
            ticketId: 1,
            assignedToUserId: "User1",
            completedByUserId: null,
            openedDate: "2023-11-19T21:53:32.014",
            completedDate: null,
            ticketStatus: 1,
            contactUserId: 1,
            title: "Issue with login",
            description: "I cannot login to my email",
            notes: null,
            internalNotes: null,
            ticketPriority: 1,
            lastModifiedTime: "2023-11-19T21:53:32.014",
            lastModifiedByUserId: 1
        },
        {
            ticketId: 2,
            assignedToUserId: null,
            completedByUserId: null,
            openedDate: "2023-11-19T21:53:32.014",
            completedDate: null,
            ticketStatus: 1,
            contactUserId: 1,
            title: "Software installation",
            description: "I need help installing Microsoft Word",
            notes: null,
            internalNotes: null,
            ticketPriority: 1,
            lastModifiedTime: "2023-11-19T21:53:32.014",
            lastModifiedByUserId: 1
        }
    ];


    // Test to check if the component renders
    it('Renders the ExistingTicket', async () => {
        render(<ExistingTickets tickets={tickets}/>);

        // Wait for the component to load
        await screen.findByText('Existing Ticket Queue');

        // Check if the initial tickets are rendered
        expect(screen.getByText('Issue with login')).toBeInTheDocument();
        expect(screen.getByText('Software installation')).toBeInTheDocument();
    });

    // Test to check if filtering unassigned works
    it('Filters unassigned tickets', async () => {
        render(<ExistingTickets tickets={tickets}/>);

        // Wait for the component to load
        await screen.findByText('Existing Ticket Queue');

        // Gets the unassigned button
        const unassignedButton = screen.getByLabelText('Unassigned');
       

         // Click on the "Unassigned" button
        fireEvent.click(unassignedButton);

        // Assert that only unassigned tickets are displayed
        expect(screen.queryByText('Issue with login')).not.toBeInTheDocument();
        expect(screen.getByText('Software installation')).toBeInTheDocument();
    });

    // Test to check if filtering assigned works
    it('Filters assigned tickets', async () => {
        render(<ExistingTickets tickets={tickets}/>);

        // Wait for the component to load
        await screen.findByText('Existing Ticket Queue');

        // Find the assigned button
        const assignedCheckbox = screen.getByLabelText('Assigned to Me');

         // Click on the "assigned" button
        fireEvent.click(assignedCheckbox);

        // Assert that only unassigned tickets are displayed
        expect(screen.getByText('Issue with login')).toBeInTheDocument();
        expect(screen.queryByText('Software installation')).not.toBeInTheDocument();
    });
});
