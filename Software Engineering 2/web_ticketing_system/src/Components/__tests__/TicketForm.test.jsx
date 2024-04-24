import React from 'react';
import { render, fireEvent, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import TicketForm from '../TicketForm';

describe('TicketForm', () => {
    it('Should trigger Submit button click', () => {
        render(<TicketForm />);
        
        // Find button in page
        const submitButton = screen.getByText('Submit');

        // Simulate user clicking submit button
        fireEvent.click(submitButton);

        // This can be used to check for whatever should be called when the button is clicked
        expect(submitButton).toBeInTheDocument();
    });
}); 