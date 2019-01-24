# Flutter-MVP Todo-List

A Sample Flutter project using Clean architecture and MVP

## Clean architecture
One of the goals of the clean architecture is to encapsulate the business logic of the application / enterprise in a clean way.

## MVP Explained
The input begins with the View, not the Presenter.

There is a one-to-one mapping between the View and the associated Presenter.

The View holds a reference to the Presenter. The Presenter is also reacting to events being triggered from the View, so its aware of the View its associated with.

The Presenter updates the View based on the requested actions it performs on the Model, but the View is not Model aware.


# Screenshots

![test](https://github.com/akinsete/Flutter-Todo-MVP-App/blob/master/assets/images/sign_in.png){:height="24px" width="48px"}

## Contact Developer
[Twitter](https://twitter.com/AkinseteSunday)

## License
Copyright 2019 Sunday Akinsete

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an 
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.