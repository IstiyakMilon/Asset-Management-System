import React from 'react';
import { NavLink } from 'react-router-dom';
import Footer from '../../shared/Footer/Footer';
import Header from '../../shared/Header/Header';
import './SignUp.css';

const SignUp = () => {
    return (
        <div className='parent'>
            <Header></Header>
            <section className="form vh-100">
                <div className="container-fluid h-custom">
                    <div className="row d-flex justify-content-center align-items-center h-100">
                        <div className="col-md-9 col-lg-6 col-xl-5">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                                className="img-fluid" alt="Sample image" />
                        </div>
                        <div className="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                            <form>


                                <div className="form-outline mb-4">
                                    <input type="text" id="form3Example3" className="form-control form-control-lg"
                                        placeholder="First name" />
                                    {/* <label className="form-label" for="form3Example3">Email address</label> */}
                                </div>
                                <div className="form-outline mb-4">
                                    <input type="text" id="form3Example3" className="form-control form-control-lg"
                                        placeholder="Last name" />
                                    {/* <label className="form-label" for="form3Example3">Email address</label> */}
                                </div>
                                <div className="form-outline mb-4">
                                    <input type="email" id="form3Example3" className="form-control form-control-lg"
                                        placeholder="Enter a valid email address" />
                                    {/* <label className="form-label" for="form3Example3">Email address</label> */}
                                </div>

                                <div className="form-outline mb-3">
                                    <input type="password" id="form3Example4" className="form-control form-control-lg"
                                        placeholder="Enter password" />
                                    {/* <label className="form-label" for="form3Example4">Password</label> */}
                                </div>

                                <div className="d-flex justify-content-between align-items-center">
                                    <div className="form-check mb-0">
                                        <input className="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
                                        <label className="form-check-label" for="form2Example3">
                                            Remember me
                                        </label>
                                    </div>
                                    <a href="#!" className="text-body">Forgot password?</a>
                                </div>

                                <div className="text-center text-lg-start mt-4 pt-2">
                                    <button type="button" className="btn btn-primary btn-lg"
                                        style={{ paddingLeft: '2.5 rem', paddingRight: '2.5 rem' }}>Register</button>
                                    <p className="small fw-bold mt-2 pt-1 mb-0">Already have an account? <NavLink to='/sign-in'
                                        className="link-danger">Login</NavLink></p>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>

            </section>
            <Footer></Footer>
        </div>
    );
};

export default SignUp;