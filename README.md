# 🌍 AtmoPredict - Extreme Weather Forecasting System

> An intelligent weather prediction system using machine learning to forecast extreme weather conditions with NASA POWER data

[![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)](https://www.python.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.109+-green.svg)](https://fastapi.tiangolo.com/)
[![React](https://img.shields.io/badge/React-19.1+-61DAFB.svg)](https://reactjs.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Technology Stack](#-technology-stack)
- [System Architecture](#-system-architecture)
- [Installation](#-installation)
- [Usage](#-usage)
- [API Documentation](#-api-documentation)
- [Model Details](#-model-details)
- [Project Structure](#-project-structure)
- [Contributing](#-contributing)

## 🎯 Overview

**AtmoPredict** is an advanced weather forecasting system that predicts the probability of five extreme weather conditions:

- 🔥 **Very Hot** - High temperature events
- ❄️ **Very Cold** - Low temperature events
- 💨 **Very Windy** - High wind speed events
- 🌧️ **Very Wet** - Heavy precipitation events
- 🥵 **Very Uncomfortable** - High heat index conditions

The system uses machine learning models trained on historical NASA POWER weather data (2010-2023) and provides real-time predictions through an interactive web interface.

## ✨ Features

### 🤖 Machine Learning
- **Multiple ML Models**: Logistic Regression, Random Forest, XGBoost, LightGBM
- **Automatic Model Selection**: Best model chosen based on validation ROC-AUC
- **Advanced Feature Engineering**: 100+ engineered features including:
  - Temporal patterns (day, month, season)
  - Lag features (1, 2, 3, 7 days)
  - Rolling statistics (3, 7, 14, 30-day windows)
  - Trend analysis and historical comparisons
  - Interaction features

### 🌐 Web Interface
- **Modern React UI** with Tailwind CSS and DaisyUI
- **Interactive Maps** using Leaflet for location selection
- **Real-time Forecasts** with probability visualizations
- **Multi-day Predictions** with detailed weather insights
- **Responsive Design** for desktop and mobile

### 🚀 Backend API
- **FastAPI** for high-performance async operations
- **RESTful Endpoints** for forecasting and climate data
- **Automatic Documentation** with Swagger UI
- **CORS Enabled** for cross-origin requests
- **Health Check** and monitoring endpoints

### 📊 Model Evaluation
- **ROC-AUC & PR-AUC** metrics
- **Calibration Curves** for probability reliability
- **Confusion Matrices** and classification reports
- **Feature Importance** analysis
- **Comprehensive Visualizations** saved as PNG files

## 🛠 Technology Stack

### Backend
- **Python 3.8+** - Core programming language
- **FastAPI** - Modern async web framework
- **Uvicorn** - ASGI server
- **scikit-learn** - Classical ML algorithms
- **XGBoost** - Gradient boosting framework
- **LightGBM** - Fast gradient boosting
- **pandas/numpy** - Data manipulation

### Frontend
- **React 19** - UI library
- **Vite** - Build tool and dev server
- **Tailwind CSS** - Utility-first CSS framework
- **DaisyUI** - Component library
- **Leaflet** - Interactive maps
- **Axios** - HTTP client
- **Plotly.js** - Data visualization

### Data Source
- **NASA POWER API** - Global weather and solar data
- **Coverage**: 2010-2023 historical data
- **Resolution**: Daily temporal granularity
- **Parameters**: Temperature, precipitation, wind, humidity, pressure, cloud cover

## 🏗 System Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                      USER INTERFACE                          │
│                  (React + Tailwind + Leaflet)               │
│                   http://localhost:5173                     │
└──────────────────────────┬──────────────────────────────────┘
                           │ HTTP/JSON
                           ↓
┌─────────────────────────────────────────────────────────────┐
│                     BACKEND API                              │
│                   (FastAPI + Uvicorn)                       │
│                   http://127.0.0.1:8000                     │
│  ┌────────────────────────────────────────────────────┐    │
│  │  Endpoints:                                         │    │
│  │  • POST /forecast/hybrid  - Main forecast          │    │
│  │  • POST /forecast         - Compatibility wrapper  │    │
│  │  • GET  /climate/summary  - Climate information    │    │
│  │  • GET  /docs             - API documentation      │    │
│  │  • GET  /health           - Health check           │    │
│  └────────────────────────────────────────────────────┘    │
└──────────────────────────┬──────────────────────────────────┘
                           │
                           ↓
┌─────────────────────────────────────────────────────────────┐
│                  MACHINE LEARNING MODELS                     │
│                  (models/trained/*.pkl)                      │
│  ┌────────────────────────────────────────────────────┐    │
│  │  5 Binary Classifiers:                              │    │
│  │  • very_hot_model.pkl                               │    │
│  │  • very_cold_model.pkl                              │    │
│  │  • very_windy_model.pkl                             │    │
│  │  • very_wet_model.pkl                               │    │
│  │  • very_uncomfortable_model.pkl                     │    │
│  └────────────────────────────────────────────────────┘    │
└──────────────────────────┬──────────────────────────────────┘
                           │
                           ↓
┌─────────────────────────────────────────────────────────────┐
│                    DATA SOURCES                              │
│                                                              │
│  • Historical Weather Data (data/processed/)                │
│  • NASA POWER API (for new data)                            │
│  • Location Mappings (data/location_mapping.json)           │
│  • Continental/Hemisphere Data                              │
└─────────────────────────────────────────────────────────────┘
```

## 📥 Installation

### Prerequisites

- **Python 3.8+** installed
- **Node.js 16+** and npm installed
- **Git** installed
- **Windows OS** (batch files provided) or adapt for Linux/Mac

### Step 1: Clone the Repository

```bash
git clone https://github.com/namanxdev/AtmoPredict.git
cd AtmoPredict
```

### Step 2: Backend Setup

#### Option A: Using Batch File (Windows)

```bash
INSTALL_FIRST.bat
```

This will:
- Create a Python virtual environment
- Install all required Python packages
- Verify installation

#### Option B: Manual Installation

```bash
# Create virtual environment
python -m venv venv

# Activate virtual environment
venv\Scripts\activate  # Windows
# source venv/bin/activate  # Linux/Mac

# Install dependencies
pip install -r requirements.txt
```

### Step 3: Frontend Setup

```bash
cd Frontend_nasa

# Install Node.js dependencies
npm install

cd ..
```

### Step 4: Verify Installation

```bash
python check_installation.py
```

## 🚀 Usage

### Quick Start (Recommended)

Use the provided batch files to start the entire system:

#### Option 1: Complete System

```bash
START_COMPLETE_SYSTEM.bat
```

This starts both the backend API and frontend development server.

#### Option 2: Manual Start

**Terminal 1 - Start Backend API:**
```bash
venv\Scripts\activate
uvicorn src.api:app --host 127.0.0.1 --port 8000 --reload
```

**Terminal 2 - Start Frontend:**
```bash
cd Frontend_nasa
npm run dev
```

### Access the Application

- **Frontend UI**: http://localhost:5173
- **Backend API**: http://127.0.0.1:8000
- **API Documentation**: http://127.0.0.1:8000/docs
- **Alternative API Docs**: http://127.0.0.1:8000/redoc

### Using the Web Interface

1. **Open the Application**: Navigate to http://localhost:5173
2. **Enter Location**: 
   - Click on the map to select a location
   - Or enter latitude/longitude manually
3. **View Current Weather**: See real-time weather conditions
4. **Get Forecast**: Click "Get Forecast" to see predictions
5. **Analyze Results**: View probabilities and risk levels for each extreme condition

## 📡 API Documentation

### Main Forecast Endpoint

**POST** `/forecast/hybrid`

Request body:
```json
{
  "latitude": 40.7128,
  "longitude": -74.0060,
  "forecast_days": 7,
  "location_name": "New York"
}
```

Response:
```json
{
  "location": {
    "name": "New York",
    "latitude": 40.7128,
    "longitude": -74.006,
    "continent": "North America",
    "hemisphere": "Northern"
  },
  "current_weather": {
    "temperature": 22.5,
    "feels_like": 24.3,
    "humidity": 65,
    "wind_speed": 3.2,
    "description": "Partly cloudy"
  },
  "forecast": [
    {
      "date": "2024-10-06",
      "predictions": {
        "very_hot": 0.12,
        "very_cold": 0.05,
        "very_windy": 0.18,
        "very_wet": 0.35,
        "very_uncomfortable": 0.09
      },
      "risk_level": "MODERATE",
      "max_risk_category": "very_wet"
    }
  ],
  "summary": {
    "highest_risk_day": "2024-10-08",
    "dominant_risk": "very_wet",
    "average_risk_level": "MODERATE"
  }
}
```

### Climate Summary Endpoint

**GET** `/climate/summary`

Query parameters:
- `latitude` (required): Latitude coordinate
- `longitude` (required): Longitude coordinate

Response:
```json
{
  "location": {
    "latitude": 40.7128,
    "longitude": -74.006,
    "continent": "North America",
    "hemisphere": "Northern"
  },
  "climate_info": {
    "description": "Humid subtropical climate",
    "temperature_range": "Cold winters, hot summers",
    "precipitation": "Evenly distributed throughout year"
  }
}
```

### Health Check Endpoint

**GET** `/health`

Response:
```json
{
  "status": "healthy",
  "models_loaded": 5,
  "timestamp": "2024-10-05T12:00:00"
}
```

## 🤖 Model Details

### Training Process

1. **Data Collection** (`src/data_collection.py`)
   - Fetches historical weather data from NASA POWER API
   - Covers 2010-2023 timeframe
   - Multiple global locations

2. **Feature Engineering** (`src/feature_engineering.py`)
   - Creates 100+ features from raw data
   - Temporal, lag, rolling, trend, and interaction features
   - Handles missing values and outliers

3. **Model Training** (`src/train_models.py`)
   - Trains 4 models per target (Logistic Regression, Random Forest, XGBoost, LightGBM)
   - Chronological train/validation/test split (60%/20%/20%)
   - Handles class imbalance with weighted classes
   - Selects best model based on ROC-AUC

4. **Evaluation** (`src/evaluate.py`)
   - Comprehensive metrics (ROC-AUC, PR-AUC, Brier Score)
   - Visualizations saved to `evaluation_results/`
   - Feature importance analysis

### Extreme Condition Definitions

Based on historical percentiles from 2010-2023 data:

- **Very Hot**: Temperature > 95th percentile for location
- **Very Cold**: Temperature < 5th percentile for location
- **Very Windy**: Wind speed > 90th percentile for location
- **Very Wet**: Precipitation > 90th percentile for location
- **Very Uncomfortable**: Heat index > 95th percentile for location

### Risk Level Calculation

```python
max_probability = max(all_predictions)

if max_probability >= 0.8:   risk_level = "EXTREME"
elif max_probability >= 0.6: risk_level = "HIGH"
elif max_probability >= 0.4: risk_level = "MODERATE"
elif max_probability >= 0.2: risk_level = "LOW"
else:                        risk_level = "MINIMAL"
```

## 📁 Project Structure

```
AtmoPredict/
│
├── 📄 README.md                      # This file
├── 📄 ARCHITECTURE.md                # Detailed system architecture
├── 📄 requirements.txt               # Python dependencies
├── 📄 config.yaml                    # Configuration file
├── 📄 .gitignore                     # Git ignore rules
│
├── 🚀 INSTALL_FIRST.bat             # Installation script
├── 🚀 START_COMPLETE_SYSTEM.bat     # Start entire system
├── 🚀 START_HYBRID_API.bat          # Start backend only
├── 🚀 RETRAIN_MODELS.bat            # Retrain ML models
│
├── 📂 src/                           # Backend source code
│   ├── __init__.py
│   ├── api.py                        # Main FastAPI application
│   ├── data_collection.py            # NASA API data fetching
│   ├── feature_engineering.py        # Feature creation
│   ├── train_models.py               # Model training
│   ├── evaluate.py                   # Model evaluation
│   ├── data_router.py                # Location data routing
│   └── climate_service.py            # Climate information service
│
├── 📂 Frontend_nasa/                 # React frontend
│   ├── package.json                  # Node dependencies
│   ├── vite.config.js                # Vite configuration
│   ├── tailwind.config.js            # Tailwind CSS config
│   ├── index.html                    # Entry HTML
│   ├── src/
│   │   ├── App.jsx                   # Main React component
│   │   ├── components/               # React components
│   │   │   ├── WeatherMap.jsx        # Map component
│   │   │   ├── CurrentWeather.jsx    # Current weather display
│   │   │   ├── ForecastMini.jsx      # Forecast cards
│   │   │   └── ModelResponse.jsx     # ML predictions display
│   │   ├── services/                 # API services
│   │   │   ├── weatherApi.js         # Backend API calls
│   │   │   └── weatherDataManager.js # Data management
│   │   └── utils/
│   │       └── constants.js          # Configuration constants
│   └── public/                       # Static assets
│
├── 📂 data/                          # Data storage
│   ├── location_mapping.json         # Location metadata
│   ├── continents/                   # Continental climate data
│   ├── hemispheres/                  # Hemisphere climate data
│   └── raw/                          # Raw weather data (when collected)
│
├── 📂 models/                        # Trained ML models
│   └── trained/                      # Serialized model files
│       ├── very_hot_model.pkl
│       ├── very_cold_model.pkl
│       ├── very_windy_model.pkl
│       ├── very_wet_model.pkl
│       └── very_uncomfortable_model.pkl
│
├── 📂 evaluation_results/            # Model evaluation outputs
│   ├── evaluation_summary.json       # Metrics summary
│   ├── *_roc_curve.png              # ROC curves
│   ├── *_pr_curve.png               # Precision-Recall curves
│   ├── *_calibration.png            # Calibration plots
│   ├── *_confusion_matrix.png       # Confusion matrices
│   └── *_feature_importance.png     # Feature importance plots
│
└── 📂 FloatChatMap/                  # Additional dashboard tools
    └── ...                           # Climate visualization tools
```

## 🔄 Retraining Models

To retrain the models with updated data:

```bash
# Use batch file (Windows)
RETRAIN_MODELS.bat

# Or manual command
python src/train_models.py
python src/evaluate.py
```

This will:
1. Load the latest weather data
2. Engineer features
3. Train all models
4. Evaluate performance
5. Save best models and visualizations

## 🧪 Testing

### Test Backend Connection

```bash
TEST_BACKEND_CONNECTION.bat

# Or manually
python test_backend_api.py
```

### Test Hybrid Forecast

```bash
TEST_HYBRID_FORECAST.bat

# Or manually
python test_hybrid_forecast.py
```

## 🌟 Key Features Explained

### 1. Multi-Location Support
The system uses a data router to map any latitude/longitude to the nearest trained location, ensuring predictions work globally.

### 2. Real-time Weather Integration
Current weather conditions are fetched from external APIs and displayed alongside ML predictions.

### 3. Climate-Aware Predictions
The system considers continental and hemispheric climate patterns to adjust predictions.

### 4. Interactive Visualization
- Leaflet maps for location selection
- Plotly charts for trend visualization
- Progress bars for probability display
- Color-coded risk levels

### 5. Responsive Design
The interface adapts to different screen sizes, from mobile phones to desktop monitors.

## 🔮 Future Enhancements

- [ ] Real-time NASA data integration
- [ ] Extended forecast range (14+ days)
- [ ] Historical trend comparison
- [ ] Email/SMS alerts for extreme conditions
- [ ] Mobile app (React Native)
- [ ] User accounts and saved locations
- [ ] Advanced ensemble models
- [ ] Integration with more weather data sources
- [ ] Multi-language support
- [ ] Export reports as PDF

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **NASA POWER** - For providing free access to global weather data
- **FastAPI** - For the excellent async web framework
- **React Team** - For the powerful UI library
- **scikit-learn, XGBoost, LightGBM** - For robust ML algorithms
- **Leaflet** - For beautiful interactive maps

## 📧 Contact

For questions, suggestions, or collaboration:

- **GitHub**: [@namanxdev](https://github.com/namanxdev)
- **Repository**: [AtmoPredict](https://github.com/namanxdev/AtmoPredict)

## 🎓 NASA Space Apps Challenge

This project was developed for the NASA Space Apps Challenge 2025. It demonstrates the practical application of machine learning for climate science and extreme weather prediction using NASA's open data.

---

**Made with ❤️ for better weather prediction**

🌍 Predicting tomorrow's weather, today 🌤️
