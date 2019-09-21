import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min';
import React, { Component } from 'react';
import Titlebar from '../../components/Titlebar/Titlebar.jsx';
import {Row, Col, Container} from 'react-bootstrap'

export default class Window1Layout extends Component {
	render() {
		return (
			<div>
				<Titlebar title='Purdue ROV Primary Screen' />
				<Container fluid>
					<Row>
						<Col>

						</Col>
						<Col xs={6}>
							<Row xs={6}>

							</Row>
							<Row>
								<Col>
								
								</Col>
								<Col>
								
								</Col>
							</Row>
						</Col>
						<Col>
						
						</Col>
					</Row>
				</Container>
			</div>
		);
	}
}
