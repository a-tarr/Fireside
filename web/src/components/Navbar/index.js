// @flow
import React from 'react';
import { Link } from 'react-router';
import styled from 'styled-components';

const Nav = styled.nav`
  display: flex;
  align-items: center;
  padding: 0 1rem;
  height: 70px;
  background: #fff;
  box-shadow: 0 1px 1px rgba(0,0,0,.1);
`;

const StyledLink = styled(Link)`
  color: #555459;
  font-size: 22px;
  fontWeight: bold;
  :hover: {
    text-decoration: none;
  }
  :focus: {
    text-decoration: none,
  }
`;
const Navbar = () => (
  <Nav>
    <StyledLink to="/">Fireside</StyledLink>
  </Nav>
);

export default Navbar;
