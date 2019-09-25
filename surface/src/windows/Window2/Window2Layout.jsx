import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min';
import React, { Component } from 'react';
import Titlebar from '../../components/Titlebar/Titlebar.jsx';

export default class Window2Layout extends Component {
	render() {
		return (
			<div>
				<Titlebar title="Purdue ROV Second Screen" />
			</div>
		);
	}
}
