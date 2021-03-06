import axios from 'axios';
import dbUrl from '../apiKeys';

const getPublicLeagues = () =>
	new Promise((resolve, reject) => {
		axios
			.get(`${dbUrl}/League`)
			.then((response) => resolve(response.data))
			.catch(reject);
	});

const getLeague = (id) =>
	new Promise((resolve, reject) => {
		axios
			.get(`${dbUrl}/League/${id}`)
			.then((response) => resolve(response.data))
			.catch(reject);
	});

const getUserLeagues = (userId) =>
	new Promise((resolve, reject) => {
		axios
			.get(`${dbUrl}/League/owner/${userId}`)
			.then((response) => resolve(response.data))
			.catch(reject);
	});

const createLeague = (league) =>
	new Promise((resolve, reject) => {
		axios.post(`${dbUrl}/League`, league).then(resolve).catch(reject);
	});

const deleteLeague = (leagueId) =>
	new Promise((resolve, reject) => {
		axios.delete(`${dbUrl}/League/${leagueId}`).then(resolve).catch(reject);
	});

const updateLeague = (id, league) =>
	new Promise((resolve, reject) => {
		axios.put(`${dbUrl}/League/${id}`, league).then(resolve).catch(reject);
	});

export {
	getPublicLeagues,
	getUserLeagues,
	getLeague,
	createLeague,
	deleteLeague,
	updateLeague,
};
