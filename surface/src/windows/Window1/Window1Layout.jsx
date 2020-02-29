import 'bootstrap/dist/css/bootstrap.min.css';
import React, { Component } from 'react';
import { ipcRenderer } from 'electron';

import Titlebar from '../../components/Titlebar/Titlebar.jsx';
import ControlColumn from '../../components/ControlColumn/ControlColumn.jsx';
import { Row, Col, Container, Button } from 'react-bootstrap';
import Camera from '../../components/Camera/Camera.jsx';
import CameraController from '../../components/Camera/CameraController.jsx';
import Gamepad from '../../components/Gamepad/Gamepad.jsx';
import { STORE_UPDATED, SAMPLE_UPDATE } from '../../constants';


export default class Window1Layout extends Component {
	constructor(props) {
		super(props);
		this.state = {
			sampleRemoteUpdate: 0
		};
	}

	render() {
		return (
			<Container fluid style={{ padding: '0' }}>
				<Titlebar title='Purdue ROV Primary Screen' />
				<Row noGutters='true' style={{ height: '94%' }}>
					<Col style={{ padding: '.5rem' }}>
						<ControlColumn>
						</ControlColumn>
					</Col>
					<Col xs={6}>
						<Row noGutters='true' style={{ height: '70%', padding: '.5rem' }}>
							<Col>
								<ControlColumn>
									<Camera />
								</ControlColumn>
							</Col>
						</Row>
						<Row noGutters='true' style={{ height: '30%' }}>
							<Col style={{ padding: '.5rem', maxWidth: '50%' }}>
								<ControlColumn>
									<Gamepad></Gamepad>
								</ControlColumn>
							</Col>
							<Col style={{ padding: '.5rem', maxWidth: '50%' }}>
								<ControlColumn>
									electron.remote example: {this.state.sampleRemoteUpdate}
								</ControlColumn>
							</Col>
						</Row>
					</Col>
					<Col style={{ padding: '.5rem' }}>
						<ControlColumn />
					</Col>
				</Row>
			</Container>
		);
	}
}
