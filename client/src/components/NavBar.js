import React from 'react';
import { Navbar, NavbarBrand, Nav, NavItem } from 'reactstrap';
import { Link } from 'react-router-dom';

export default function NavBar() {
	return (
		<Navbar className='nav-bar' dark>
			<NavbarBrand href='/'>Tourney Tracker</NavbarBrand>
			<Nav className='me-auto' navbar>
				<NavItem>
					<Link className='nav-link' to='/my-leagues'>
						My Leagues
					</Link>
				</NavItem>
			</Nav>
		</Navbar>
	);
}
