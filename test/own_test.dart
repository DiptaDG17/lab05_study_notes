
// Part 7: your own tests (at least 2, besides the example). They must test real code.
// Ideas: a 100-character title is accepted; body is trimmed; 'network-request-failed';
// signUp failure with whenCalling(...).thenThrow(...) (see lab05_test.dart).
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab05_study_notes/data/auth_repository.dart';
import 'package:lab05_study_notes/data/notes_repository.dart';

void main() {
  // Create one fake first: it makes FieldValue.serverTimestamp() work in tests.
  setUpAll(FakeFirebaseFirestore.new);

  test('example: messageFor maps weak-password', () {
    expect(AuthRepository.messageFor('weak-password'), contains('6 characters'));
  });

  // TODO(7): your tests

  test('addNote accepts a title with exactly 100 characters', () async {
    final db = FakeFirebaseFirestore();
    final repository = NotesRepository(db);
    final title = 'A' * 100;

    await repository.addNote('test-user', title, 'Test body');

    final snapshot = await db
        .collection('users')
        .doc('test-user')
        .collection('notes')
        .get();

    expect(snapshot.docs.length, 1);
    expect(snapshot.docs.first.data()['title'], title);
  });

  test('addNote trims the title and body before saving', () async {
    final db = FakeFirebaseFirestore();
    final repository = NotesRepository(db);

    await repository.addNote(
      'test-user',
      '  Flutter Notes  ',
      '  Study Firebase  ',
    );

    final snapshot = await db
        .collection('users')
        .doc('test-user')
        .collection('notes')
        .get();

    expect(snapshot.docs.length, 1);
    expect(snapshot.docs.first.data()['title'], 'Flutter Notes');
    expect(snapshot.docs.first.data()['body'], 'Study Firebase');
  });

  test('messageFor maps network-request-failed', () {
    expect(
      AuthRepository.messageFor('network-request-failed'),
      'No connection. Check your network.',
    );
  });
}

