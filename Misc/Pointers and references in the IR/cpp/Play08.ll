; ModuleID = 'Play08.cpp'
source_filename = "Play08.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.A = type { %struct.Inner, i64, i64, [3 x i32] }
%struct.Inner = type { i64 }

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local void @_Z6by_val1A(%struct.A* noundef byval(%struct.A) align 8 %0) #0 {
  %2 = getelementptr inbounds %struct.A, %struct.A* %0, i32 0, i32 1
  store i64 1111, i64* %2, align 8
  %3 = getelementptr inbounds %struct.A, %struct.A* %0, i32 0, i32 2
  store i64 2222, i64* %3, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local void @_Z6by_refR1A(%struct.A* noundef nonnull align 8 dereferenceable(40) %0) #0 {
  %2 = alloca %struct.A*, align 8
  store %struct.A* %0, %struct.A** %2, align 8
  %3 = load %struct.A*, %struct.A** %2, align 8
  %4 = getelementptr inbounds %struct.A, %struct.A* %3, i32 0, i32 1
  store i64 1111, i64* %4, align 8
  %5 = load %struct.A*, %struct.A** %2, align 8
  %6 = getelementptr inbounds %struct.A, %struct.A* %5, i32 0, i32 2
  store i64 2222, i64* %6, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local void @_Z6by_ptrP1A(%struct.A* noundef %0) #0 {
  %2 = alloca %struct.A*, align 8
  store %struct.A* %0, %struct.A** %2, align 8
  %3 = load %struct.A*, %struct.A** %2, align 8
  %4 = getelementptr inbounds %struct.A, %struct.A* %3, i32 0, i32 1
  store i64 1111, i64* %4, align 8
  %5 = load %struct.A*, %struct.A** %2, align 8
  %6 = getelementptr inbounds %struct.A, %struct.A* %5, i32 0, i32 2
  store i64 2222, i64* %6, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local void @_Z7ret_valv(%struct.A* noalias sret(%struct.A) align 8 %0) #0 {
  %2 = bitcast %struct.A* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %2, i8 0, i64 40, i1 false)
  %3 = bitcast i8* %2 to %struct.A*
  %4 = getelementptr inbounds %struct.A, %struct.A* %3, i32 0, i32 0
  %5 = getelementptr inbounds %struct.Inner, %struct.Inner* %4, i32 0, i32 0
  store i64 1111, i64* %5, align 8
  %6 = getelementptr inbounds %struct.A, %struct.A* %3, i32 0, i32 1
  store i64 3333, i64* %6, align 8
  %7 = getelementptr inbounds %struct.A, %struct.A* %3, i32 0, i32 2
  store i64 4444, i64* %7, align 8
  %8 = getelementptr inbounds %struct.A, %struct.A* %0, i32 0, i32 1
  store i64 1111, i64* %8, align 8
  %9 = getelementptr inbounds %struct.A, %struct.A* %0, i32 0, i32 2
  store i64 2222, i64* %9, align 8
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: mustprogress noinline norecurse nounwind uwtable
define dso_local noundef i32 @main() #2 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.A, align 8
  %3 = alloca %struct.A, align 8
  %4 = alloca %struct.A, align 8
  store i32 0, i32* %1, align 4
  %5 = bitcast %struct.A* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %5, i8 0, i64 40, i1 false)
  %6 = bitcast i8* %5 to %struct.A*
  %7 = getelementptr inbounds %struct.A, %struct.A* %6, i32 0, i32 0
  %8 = getelementptr inbounds %struct.Inner, %struct.Inner* %7, i32 0, i32 0
  store i64 1111, i64* %8, align 8
  %9 = getelementptr inbounds %struct.A, %struct.A* %6, i32 0, i32 1
  store i64 3333, i64* %9, align 8
  %10 = getelementptr inbounds %struct.A, %struct.A* %6, i32 0, i32 2
  store i64 4444, i64* %10, align 8
  %11 = bitcast %struct.A* %3 to i8*
  %12 = bitcast %struct.A* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %11, i8* align 8 %12, i64 40, i1 false)
  call void @_Z6by_val1A(%struct.A* noundef byval(%struct.A) align 8 %3)
  call void @_Z6by_refR1A(%struct.A* noundef nonnull align 8 dereferenceable(40) %2)
  call void @_Z6by_ptrP1A(%struct.A* noundef %2)
  call void @_Z7ret_valv(%struct.A* sret(%struct.A) align 8 %4)
  ret i32 0
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { mustprogress noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nounwind willreturn writeonly }
attributes #2 = { mustprogress noinline norecurse nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
