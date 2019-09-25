import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min';
import React, { Component } from 'react';
import Titlebar from '../../components/Titlebar/Titlebar.jsx';
import ControlColumn from '../../components/ControlColumn/ControlColumn.jsx';
import {Row, Col, Container} from 'react-bootstrap';

export default class Window1Layout extends Component {
	render() {
		return (
			<Container fluid style={{padding: '0'}}>
				<Titlebar title='Purdue ROV Primary Screen' />
				<Row noGutters='true' style={{height: '94%'}}>
					<Col style={{padding: '.5rem'}}>
						<ControlColumn/>
					</Col>
					<Col xs={6} style={{}}>
						<Row noGutters='true' style={{height: '70%', padding: '.5rem'}}>
							<Col>
								<ControlColumn/>
							</Col>
						</Row>
						<Row noGutters='true' style={{height: '30%'}}>
							<Col style={{padding: '.5rem'}}>
								<ControlColumn/>
							</Col>
							<Col style={{padding: '.5rem'}}>
								<ControlColumn/>
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
