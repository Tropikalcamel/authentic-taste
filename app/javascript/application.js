// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
// app/javascript/packs/application.js

import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";
import CarouselController from "controllers/carousel_controller.js";

const application = Application.start();
const context = require.context("../controllers", true, /\.js$/);
application.load(definitionsFromContext(context));
application.register("carousel", CarouselController);

