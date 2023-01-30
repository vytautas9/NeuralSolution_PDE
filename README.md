<a name="readme-top"></a>

<div align="center">
<h3 align="center">Neural Solution of Elliptic Partial Differential Equation Problem for Single Phase Flow in Porous Media</h3>
  <p align="center">
    This project approximates an elliptic partial differential equation (PDE) solution using Neural Networks.
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#prerequisites">Prerequisites</a></li>
    <li>
      <a href="#usage">Usage</a>
      <ul>
        <li><a href="#generating-samples">Generating samples</a></li>
        <li><a href="#using-neural-networks">Using neural networks</a></li>
      </ul>
    </li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This project is an exercise in solving an elliptic partial differential equation (PDE), the application background of which is flow in porous media in 2D. Typical application area is subsurface hydrogeology, subsurface hydrocarbon flows and geothermal applications. The Darcy’s flow equation is a second order PDE commonly used for solving fluid flow through porous media:

$$v = - \dfrac{K}{\mu}(\nabla p + \rho g \nabla z) $$

where is K the permeability or conductivity of the porous medium, $v$ – Darcy’s flow velocity, $p$ – pressure, $\rho$ – fluid density, $\mu$ – dynamic viscosity of the fluid, $g$ – gravitational constant, $z$ – spatial direction.

Darcy’s flow equation can be solved by assuming constant porosity of the porous media domain and incompressibility, which reduces the equation into an elliptic equation. The equation’s solution can be approximated via a neural network (NN).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- PREREQUISITES -->
## Prerequisites

Required languages (versions during initial development):
* MATLAB (R2022a 0.12.0.1994302)
* Python (3.10.9)

<!-- USAGE EXAMPLES -->
## Usage

Project consists of 2 parts: generating samples using MATLAB and building neural networks using Python.

### Generating samples
Use [main.m](main.m) to generate samples.

Provide a folder location, where the data should be saved:
``` matlab
FOLDER_LOCATION = 'YOUR LOCATION\data\';
```
next, specify how many samples will be generated:
``` matlab
DATASET_SIZE = 5;
```
this determines, how many permeability and target map files will be created. Next specify what is the grid of the maps (X:Y:1):
``` matlab
GRID_X_SIZE = 8;
GRID_Y_SIZE = 8;
```
The program will then execute [createPermeabilityAndTarget.m](createPermeabilityAndTarget.m) script which creates and saves desired samples. For each sample, a separate .mat file will be created. To combine those samples, we'll use [transformPermeabilityAndTargetTo1D.m](transformPermeabilityAndTargetTo1D.m) script to combine samples into one .mat file.


### Using neural networks
[neuralsolution_pde.ipynb](neuralsolution_pde.ipynb) notebook was used to import, train, experiment and save NN results.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

Vytautas Kraujalis - [LinkedIn](https://www.linkedin.com/in/vytautaskraujalis/) - vytautas.kraujalis2@gmail.com

Project Link: [https://github.com/vytautas9/NeuralSolution_PDE](https://github.com/vytautas9/NeuralSolution_PDE)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
