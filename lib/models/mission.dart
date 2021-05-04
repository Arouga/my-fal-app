import 'package:fal/models/assure.dart';

class Mission {
  final String id;
  final String ref;
  final String dateRecep;
  final Assure assure;
  final String vehicule;
  final String pointChock;
  final String dateSinistre;
  final String typeMission;
  final String compagnie;
  final String prestataire;
  final String observation;
  final String observationTech;
  final List<String> photosAvant;
  final List<String> photosApres;
  final List<String> photosEnCours;
  final List<String> photosAdverse;
  Mission({
    this.id,
    this.ref,
    this.dateRecep,
    this.assure,
    this.vehicule,
    this.pointChock,
    this.dateSinistre,
    this.typeMission,
    this.compagnie,
    this.prestataire,
    this.observation,
    this.observationTech,
    this.photosAvant,
    this.photosApres,
    this.photosEnCours,
    this.photosAdverse,
  });
}
