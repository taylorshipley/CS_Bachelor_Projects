import { Inter } from 'next/font/google'
import React from 'react';
import './global.css'
import AuthProvider from './AuthProvider';


const inter = Inter({ subsets: ['latin'] })

export const metadata = {
  title: 'Web-Ticket-System',
  description: 'Team 3',
}

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>
        {/* { children } */}
        <AuthProvider>{children}</AuthProvider>
      </body>
    </html>
  )
}
