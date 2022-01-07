import React, { useState } from 'react';
import { useNavigate } from "react-router-dom";
import { Form, FormGroup, Label, Input, Button } from 'reactstrap';
import { createLeague } from '../../helpers/data/leagueData';

export default function LeagueForm() {
	const [league, setLeague] = useState({
		ownerId: 1,
		name: '',
		description: '',
		isPrivate: false,
		minimumRating: '',
		startingRating: '',
	});
  let navigate = useNavigate();

	const handleInputChange = (e) => {
		setLeague((prevState) => ({
			...prevState,
			[e.target.name]:
				e.target.name === 'isPrivate' ? e.target.checked : e.target.value,
		}));
	};

	const handleSubmit = (e) => {
		e.preventDefault();

		let newLeague = league;

		newLeague.minimumRating = Number.parseInt(league.minimumRating);
		newLeague.startingRating = Number.parseInt(league.startingRating);

		createLeague(newLeague);

		navigate('/')
	};

	return (
		<Form onSubmit={handleSubmit}>
			<Label>* = required</Label>
			<FormGroup>
				<Label for='nameInput'>*League Name</Label>
				<Input
					id='nameInput'
					name='name'
					onChange={handleInputChange}
					value={league.name}
					type='text'
					placeholder='my league'
					required
				/>
			</FormGroup>
			<FormGroup>
				<Label for='descriptionInput'>Description</Label>
				<Input
					id='descriptionInput'
					name='description'
					onChange={handleInputChange}
					value={league.description}
					type='textarea'
				/>
			</FormGroup>
			<FormGroup check>
				<Input
					id='private'
					type='checkbox'
					name='isPrivate'
					onChange={handleInputChange}
				/>
				<Label check for='private'>
					Private
				</Label>
			</FormGroup>
			<FormGroup>
				<Label for='minimumRatingInput'>*Minimum Elo Rating</Label>
				<Input
					id='minimumRatingInput'
					name='minimumRating'
					onChange={handleInputChange}
					value={league.minimumRating}
					placeholder='0'
					type='number'
					required
				/>
			</FormGroup>
			<FormGroup>
				<Label for='startingRatingInput'>*Starting Elo Rating</Label>
				<Input
					id='startingRatingInput'
					name='startingRating'
					onChange={handleInputChange}
					value={league.startingRating}
					placeholder='1500'
					type='number'
					required
				/>
			</FormGroup>
			<Button type='submit'>Submit</Button>
		</Form>
	);
}
