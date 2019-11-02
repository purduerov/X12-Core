import 'bootstrap/dist/css/bootstrap.min.css';
import React, { Component } from 'react';
import { ipcRenderer } from 'electron';

import Titlebar from '../../components/Titlebar/Titlebar.jsx';
import ControlColumn from '../../components/ControlColumn/ControlColumn.jsx';
import {Row, Col, Container, Button} from 'react-bootstrap';
import Camera from '../../components/Camera/Camera.jsx';
import Gamepad from '../../components/Gamepad/Gamepad.jsx';

import defaultStore from '../../store/defaults.json';
import { STORE_UPDATED, SAMPLE_UPDATE } from '../../constants';


export default class Window1Layout extends Component {
	constructor(props){
		super(props);
		const sampleData = require('electron').remote.require('./src/gamepad/sample-emitter.js').sample;

		this.state = {
			gamepad: {
				sampleData: 0
			}
		};
		
		sampleData.on(SAMPLE_UPDATE, () => {
			this.setState({ gamepad: { sampleData: sampleData.number }});
		});
		
	}

	render() {
		return (
			<Container fluid style={{padding: '0'}}>
				<Titlebar title='Purdue ROV Primary Screen' />
				<Row noGutters='true' style={{height: '94%'}}>
					<Col style={{padding: '.5rem'}}>
						<ControlColumn/>
					</Col>
					<Col xs={6}>
						<Row noGutters='true' style={{height: '70%', padding: '.5rem'}}>
							<Col>
								<ControlColumn>
									<Camera></Camera>
								</ControlColumn>
							</Col>
						</Row>
						<Row noGutters='true' style={{height: '30%'}}>
							<Col style={{padding: '.5rem', maxWidth: '50%'}}>
								<ControlColumn>
									<Gamepad></Gamepad>
								</ControlColumn>
							</Col>
							<Col style={{padding: '.5rem', maxWidth: '50%'}}>
								<ControlColumn>
									{`GamepadSampleData ${this.state.gamepad.sampleData}`}
								</ControlColumn>
							</Col>
						</Row>
					</Col>
					<Col style={{padding: '.5rem'}}>
						<ControlColumn/>
					</Col>
				</Row>
			</Container>
		);
	}
}
