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
import Dash from '../../components/DashDisplay/DashDisplay.jsx';


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
							<ExampleComponent />
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
							<Dash className='card-custom-inline' 
								  name1="Acceleration"
								  alabel1="Y:" alabel2="X:" alabel3="Z:"
								  avalue1="0" avalue2="0" avalue3="0"

								  name2="Gyro"
								  glabel1="Y:" glabel2="X:" glabel3="Z:"
								  gvalue1="0" gvalue2="0" gvalue3="0"
 
								  name3="Euler"
								  elabel1="Yaw:" elabel2="Roll:" elabel3="Pitch:"
								  evalue1="0" evalue2="10000" evalue3="0"

								  name4="Temperature"
								  tvalue="0"
 
								  name5="Linear Acceleration"
								  llabel1="Y:" llabel2="X:" llabel3="Z:"
								  lvalue1="0" lvalue2="0" lvalue3="0"
							/>
						</ControlColumn>
					</Col>
				</Row>
			</Container>
		);
	}
}
