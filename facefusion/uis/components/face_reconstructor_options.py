import streamlit as st
from typing import Optional, Dict, Any
from facefusion.uis.typing import SessionState
from facefusion.uis.choices import ProcessorId

def render(session_state : SessionState) -> None:
    with st.container():
        st.markdown('### Lighting & Depth')
        session_state['face_reconstructor_lighting_preset'] = st.selectbox(
            'Lighting Preset',
            ['Natural', 'Studio', 'Outdoor'],
            key='face_reconstructor_lighting_preset'
        )
        session_state['face_reconstructor_depth_intensity'] = st.slider(
            'Depth Intensity',
            0.0, 2.0, 1.0,
            key='face_reconstructor_depth_intensity'
        )
        session_state['face_reconstructor_show_depth'] = st.checkbox(
            'Show Depth Map',
            value=False,
            key='face_reconstructor_show_depth'
        )

def register_events(session_state : SessionState) -> None:
    if ProcessorId.FACE_RECONSTRUCTOR in session_state['processor_choices']:
        session_state['face_reconstructor_lighting_preset'] = session_state._get('face_reconstructor_lighting_preset', 'Natural')
        session_state['face_reconstructor_depth_intensity'] = session_state._get('face_reconstructor_depth_intensity', 1.0)
        session_state['face_reconstructor_show_depth'] = session_state._get('face_reconstructor_show_depth', False)
