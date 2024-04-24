import React from 'react';
import { AuthProvider } from '../context/AuthContext';



const MyApp = ({Component, pageProps }) => {    
        return (
            <AuthProvider>
                <Component {...pageProps}>
                </Component>
            </AuthProvider>
        )   
}

export default MyApp;