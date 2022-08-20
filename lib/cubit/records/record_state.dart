part of "record_cubit.dart";

abstract class RecordsState extends Equatable {
  const RecordsState();
}
class InitialState extends RecordsState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class GetRecords extends RecordsState {
  final List recordPathsAsFileList;
  const GetRecords({required this.recordPathsAsFileList});

  @override
  // TODO: implement props
  List<Object?> get props => [recordPathsAsFileList];
}