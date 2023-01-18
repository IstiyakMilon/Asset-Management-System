import React from 'react';
import Footer from '../shared/Footer/Footer';
import Header from '../shared/Header/Header';

const Dashboard = () => {
    return (
        <div>
            <Header></Header>
            <div style={{ height: '500px' }}>
                Dashboard
            </div>
            <Footer></Footer>
        </div>
    );
};

export default Dashboard;