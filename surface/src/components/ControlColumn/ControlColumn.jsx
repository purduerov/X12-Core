import React from 'react';
import './controlcolumn.css';
import PropTypes from 'prop-types';

class ControlColumn extends React.Component {
	constructor(props) {
		super(props);
	}

	render() {
		return (
			<div className='control'>
				{this.props.children}
			</div>
		);
	}
}

ControlColumn.propTypes = {
	children: PropTypes.node
};

export default ControlColumn;
