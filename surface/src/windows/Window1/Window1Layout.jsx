import 'bootstrap/dist/css/bootstrap.min.css';
import React, { Component } from 'react';
import { ipcRenderer } from 'electron';

import Titlebar from '../../components/Titlebar/Titlebar.jsx';
import ControlColumn from '../../components/ControlColumn/ControlColumn.jsx';
import {Row, Col, Container, Button, Card} from 'react-bootstrap';
import Camera from '../../components/Camera/Camera.jsx';
import CameraController from '../../components/Camera/CameraController.jsx';
import Gamepad from '../../components/Gamepad/Gamepad.jsx';
import PHinfo from '../../components/PHinfo/PHinfo.jsx';
import ThrusterCircle from '../../components/ThrusterCircle/ThrusterCircle.jsx';
import ExampleComponent from '../../components/ExampleComponent/ExampleComponent.jsx';
import { STORE_UPDATED, SAMPLE_UPDATE } from '../../constants';
import '../../styles/Window1.css'; 


export default class Window1Layout extends Component {
	constructor(props){
		super(props);
		this.state = {
			activeCamera: 0,
			sampleRemoteUpdate: 0
		};

		this.changeCamera = this.changeCamera.bind(this);
	}

	changeCamera(newCamera) {
		this.setState({
			activeCamera: newCamera
		});
	}
	render() {
		return (
			<Container fluid style={{padding: '0' , color:'white'}}>
				<Titlebar title='Purdue ROV Primary Screen' />
				<Row className='camera-row custom-row'>
					<Col className='camera-col'>
						<ControlColumn>
							
						</ControlColumn>
					</Col>
				</Row>
				<Row className='function-row custom-row'>
					<Col className='side-col'>
						<ControlColumn>
							<PHinfo ph={0} temp={0} />
						</ControlColumn>
					</Col>
					<Col className='central-col'>
						<ControlColumn className='control-inline'>
							<PHinfo className='card-custom-inline' ph={0} temp={0} />
							<PHinfo className='card-custom-inline' ph={0} temp={0} />
						</ControlColumn>
					</Col>
					<Col className='side-col'>
						<ControlColumn>
							<PHinfo ph={0} temp={0} />
						</ControlColumn>
					</Col>
				</Row>
			</Container>
		);
	}
}
