import { Button } from 'bootstrap';
import React from 'react';
import { NavLink } from 'react-router-dom';
import './Header.css';

const Header = () => {
    return (
        <div>
            <nav style={{ backgroundColor: '#e9ecef', opacity: '0.9' }} class="navbar fixed-top navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Logo</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Features</a>
                            </li>
                            <li class="nav-item">
                                <NavLink class="nav-link" to='/dashboard'>Dashboard</NavLink>
                            </li>

                        </ul>



                    </div>
                    <NavLink to='/sign-in'>
                        <button style={{ marginRight: '30px', marginTop: '20px' }} type="button" class="login-btn btn btn-secondary">Log In</button>
                    </NavLink>
                </div>
            </nav>

        </div>
    );
};

export default Header;